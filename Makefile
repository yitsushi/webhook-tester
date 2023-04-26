OWNER     := yitsushi
REPO      := webhook-tester
CALLBACK  := https://e4e4-213-222-154-54.ngrok-free.app/callback?provider=github
SECRET    := 33713b74ae24b9be98a5c0f1dc4c864189294228
PRID      := 2

sub:
	@curl -L \
  		-X POST \
  		-H "Accept: application/vnd.github+json" \
  		-H "Authorization: Bearer $(GITHUB_TOKEN)"\
  		-H "X-GitHub-Api-Version: 2022-11-28" \
  		https://api.github.com/repos/$(OWNER)/$(REPO)/hooks \
  		-d '{"name":"web","active":true,"events":["pull_request","issue_comment"],"config":{"url":"$(CALLBACK)","secret":"$(SECRET)","content_type":"json","insecure_ssl":"0"}}'

comment:
	@curl -L \
		-X POST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $(GITHUB_TOKEN)"\
		-H "X-GitHub-Api-Version: 2022-11-28" \
		https://api.github.com/repos/$(OWNER)/$(REPO)/issues/$(PRID)/comments \
		-d '{"body":"Random comment from an API call"}'
