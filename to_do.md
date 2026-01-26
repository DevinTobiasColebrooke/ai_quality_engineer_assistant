🔌 Core Engine & Connectivity
- [ ] Persistent Session Linking: Update the runner to use the playwright-cli --session=ID flag. This is critical so that subsequent commands (click, type) talk to the same browser window that opened initially.
- [ ] Session Cleanup: Implement a job to run playwright-cli session-stop [ID] when a test completes or is deleted, preventing orphaned browser processes.
- [ ] Configuration Management: Create a settings area to manage API keys (Anthropic, OpenAI) and local paths for playwright-cli.
🧠 AI Agent Integration
- [ ] Real LLM Integration: Replace the current "mock" test plan generator with actual API calls to Opencode/Claude/Cursor.
- [ ] Autonomous Executor Loop: Build the logic loop:
    1.  Observe: Agent reads page content/accessibility tree.
    2.  Decide: Agent chooses the next action (click, type, assert).
    3.  Act: System executes the playwright-cli command.
- [ ] Chat Interface: Connect the sidebar "Chat" input to the agent so you can give mid-test instructions (e.g., "Now try logging in with invalid credentials").
📸 Artifacts & Reporting
- [ ] Automated Screenshot Ingestion:
    *   Detect when playwright-cli screenshot saves a file.
    *   Automatically upload it to Active Storage.
    *   Attach it to the Session record for the gallery.
- [ ] Video Recording: Enable Playwright video recording and embed the resulting .webm files in the session dashboard.
🖥️ User Interface & Experience
- [ ] Real-time Action Log: Use Turbo Streams to append logs to the sidebar instantly as the agent works (e.g., "Agent clicked 'Submit'...", "Agent found error...").
- [ ] Manual Controls: Wire up the "Open", "Click", "Type" buttons in the sidebar to actually execute CLI commands against the active session.
- [ ] Visual Feedback: Add indicators for "Agent Thinking" vs "Agent Acting".
🧪 Testing & Validation
- [ ] Validation Layer: Implement a step where the agent "Asserts" a condition (e.g., "Text 'Success' is visible") and records a Pass/Fail result in the database.
- [ ] Test History: A view to compare previous runs of the same test session.