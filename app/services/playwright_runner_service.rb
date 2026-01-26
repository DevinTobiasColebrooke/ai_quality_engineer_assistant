class PlaywrightRunnerService
  def initialize(session)
    @session = session
  end

  def call
    # 1. Update session status to "running"
    @session.update(status: "running")

    # 2. Generate a mock test plan based on the session's URL
    mock_test_plan = <<~PLAN
      1. Go to #{@session.url}
      2. Check title to ensure it's correct
      3. Scan for broken links
      4. Verify main navigation visibility
      5. Check for any console errors
    PLAN

    # 3. Save the test plan to the session
    @session.update(test_plan: mock_test_plan)

    # 4. Launch Playwright browser in headed mode (detached)
    # We use Process.spawn to avoid blocking the Rails request while the browser is open.
    command = "npx playwright-cli open '#{@session.url}' --headed"
    pid = Process.spawn(command)
    Process.detach(pid)
    Rails.logger.info("Spawned Playwright browser with PID: #{pid}")

    # 5. Update session status to "completed"
    @session.update(status: "completed")
  end
end
