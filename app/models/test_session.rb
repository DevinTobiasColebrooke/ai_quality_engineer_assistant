class TestSession < ApplicationRecord
  validates :url, presence: true
  validates :goal, presence: true

  # Helper to generate the specific prompt for the AI agent
  def agent_prompt
    <<~TEXT
      I need you to act as a QA Engineer.
      Target URL: #{url}
      Goal: #{goal}

      Please use the playwright-cli skill to:
      1. Navigate to the URL.
      2. Perform the necessary steps to achieve the goal.
      3. Take screenshots of success or failure.
      4. Report back with a summary.
    TEXT
  end
end
