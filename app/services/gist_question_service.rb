class GistQuestionService

  ACCESS_TOKEN = ENV['GITHUB_TOKEN']
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ACCESS_TOKEN);
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      "description": I18n.t('.description', title: @test.title),
      "public": true,
      "files": {
        'test-guru-questions.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end