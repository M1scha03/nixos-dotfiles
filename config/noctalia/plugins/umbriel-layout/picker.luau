local currentLayout = "…"
local currentWorkspace = ""
local changing = false
local requestInFlight = false

local function render()
  local function buttonVariant(layout)
    if layout == currentLayout then return "primary" end
    return "ghost"
  end

  local statusText = currentLayout
  if currentWorkspace ~= "" then
    statusText = currentWorkspace .. "  ·  " .. currentLayout
  end

  panel.render(
    ui.column({ gap = 12, padding = 14 }, {
      ui.row({ align = "center", justify = "space_between", gap = 10 }, {
        ui.column({ gap = 2, flexGrow = 1 }, {
          ui.label({ text = "Workspace layout", fontWeight = "bold" }),
          ui.label({ text = statusText, color = "secondary" }),
        }),
        ui.button({
          glyph = "x",
          variant = "ghost",
          tooltip = "Close",
          onClick = "closePicker",
        }),
      }),

      ui.row({ gap = 6, align = "center" }, {
        ui.button({
          text = "Dwindle",
          variant = buttonVariant("dwindle"),
          enabled = not changing,
          flexGrow = 1,
          onClick = "chooseDwindle",
        }),
        ui.button({
          text = "Scrolling",
          variant = buttonVariant("scrolling"),
          enabled = not changing,
          flexGrow = 1,
          onClick = "chooseScrolling",
        }),
        ui.button({
          text = "Master",
          variant = buttonVariant("master"),
          enabled = not changing,
          flexGrow = 1,
          onClick = "chooseMaster",
        }),
      }),
    })
  )
end

local function refresh()
  if requestInFlight then return end
  requestInFlight = true

  local accepted = noctalia.runAsync(
    { "umbriel", "workspaces", "--json" },
    function(result)
      requestInFlight = false

      if result.exitCode ~= 0 then
        currentLayout = "umbriel?"
        currentWorkspace = ""
        render()
        return
      end

      local ok, workspaces = pcall(noctalia.json.decode, result.stdout or "")
      if not ok or type(workspaces) ~= "table" then
        currentLayout = "layout?"
        currentWorkspace = ""
        render()
        return
      end

      for _, workspace in ipairs(workspaces) do
        if workspace.focused == true then
          currentLayout = workspace.layout or "layout?"
          currentWorkspace = workspace.name or workspace.id or ""
          render()
          return
        end
      end

      currentLayout = "layout?"
      currentWorkspace = ""
      render()
    end
  )

  if not accepted then
    requestInFlight = false
    currentLayout = "umbriel?"
    currentWorkspace = ""
    render()
  end
end

local function setLayout(layout)
  if changing or layout == currentLayout then return end

  changing = true
  currentLayout = layout
  render()

  local accepted = noctalia.runAsync(
    { "umbriel", "msg", "workspace-set-layout:" .. layout },
    function(result)
      changing = false

      if result.exitCode ~= 0 then
        noctalia.log(
          "Could not set Umbriel layout to " .. layout .. ": " .. (result.stderr or "")
        )
      end

      refresh()
    end
  )

  if not accepted then
    changing = false
    refresh()
  end
end

function onOpen(context)
  currentLayout = "…"
  currentWorkspace = ""
  changing = false
  render()
  refresh()
end

function update()
  noctalia.setUpdateInterval(300)
  refresh()
end

function closePicker()
  panel.close()
end

function chooseDwindle()
  setLayout("dwindle")
end

function chooseScrolling()
  setLayout("scrolling")
end

function chooseMaster()
  setLayout("master")
end
