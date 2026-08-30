local currentLayout = "…"
local requestInFlight = false

local function refresh()
  if requestInFlight then return end
  requestInFlight = true

  local accepted = noctalia.runAsync(
    { "umbriel", "workspaces", "--json" },
    function(result)
      requestInFlight = false

      if result.exitCode ~= 0 then
        currentLayout = "umbriel?"
        noctalia.log("umbriel workspaces --json failed: " .. (result.stderr or ""))
        return
      end

      local ok, workspaces = pcall(noctalia.json.decode, result.stdout or "")
      if not ok or type(workspaces) ~= "table" then
        currentLayout = "layout?"
        noctalia.log("Could not decode Umbriel workspace JSON")
        return
      end

      for _, workspace in ipairs(workspaces) do
        if workspace.focused == true then
          currentLayout = workspace.layout or "layout?"
          return
        end
      end

      for _, workspace in ipairs(workspaces) do
        if workspace.active == true then
          currentLayout = workspace.layout or "layout?"
          return
        end
      end

      currentLayout = "layout?"
    end
  )

  if not accepted then
    requestInFlight = false
    currentLayout = "umbriel?"
  end
end

function update()
  noctalia.setUpdateInterval(50)

  if not noctalia.commandExists("umbriel") then
    barWidget.setText("umbriel?")
    barWidget.setTooltip("Umbriel executable not found")
    return
  end

  refresh()
  barWidget.setText(currentLayout)
  barWidget.setTooltip("Layout: " .. currentLayout .. " · click to change")
end

function onClick()
  noctalia.togglePanel("local/umbriel-layout:picker")
end
