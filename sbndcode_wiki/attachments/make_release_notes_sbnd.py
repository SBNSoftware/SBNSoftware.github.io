import requests

def fetch_pr_details(repo, tag_from, tag_to, github_token):
    url = f"https://api.github.com/repos/SBNSoftware/{repo}/compare/{tag_from}...{tag_to}"
    print(f'url: {url}')
    headers = {'Authorization': f'token {github_token}'}
    response = requests.get(url, headers=headers)
    data = response.json()

    with open(f"release_notes_{repo}_{tag_from}_{tag_to}.md", 'w') as f:
      print(f"### Release Notes for [{repo}] from {tag_from} to {tag_to}")
      f.write(f"### Release Notes for [{repo}] from {tag_from} to {tag_to}\n")

      if 'commits' in data:
          for commit in data['commits']:
              if "Merge pull request" in commit['commit']['message']:
                  pr_number = commit['commit']['message'].split()[3].strip('#')
                  pr_url = f"https://api.github.com/repos/SBNSoftware/{repo}/pulls/{pr_number}"
                  pr_response = requests.get(pr_url, headers=headers)
                  pr_data = pr_response.json()

                  #Print PR details
                  # print(f"- **PR #{pr_number}: {pr_data.get('title', 'N/A')}**")
                  # print(f"  - **Description**: {extract_section(pr_data['body'], 'Description', 'Checklist')}")
                  # print(f"  - **Checklist**: {extract_section(pr_data['body'], 'Checklist', 'Relevant PR links')}")
                  # print(f"  - **Relevant PR links**: {extract_section(pr_data['body'], 'Relevant PR links', 'Link to docdb')}")
                  # print(f"  - **Documentation Links**: {extract_section(pr_data['body'], 'Link to docdb', '')}")
                  # print(f"  - **Labels**: {', '.join([label['name'] for label in pr_data['labels']])}")
                  # print(f"  - **Reviewers**: {', '.join([reviewer['login'] for reviewer in pr_data['requested_reviewers']])}")
                  # print(f"  - **Assignees**: {', '.join([assignee['login'] for assignee in pr_data['assignees']])}")
                  
                  #Write PR details to file
                  f.write(f"- PR #{pr_number}: {pr_data.get('title', 'N/A')}\n")
                  f.write(f"  - **Description**: {extract_section(pr_data['body'], 'Description', 'Checklist')}\n")
                  #f.write(f"  - **Checklist**: {extract_section(pr_data['body'], 'Checklist', 'Relevant PR links')}")
                  #f.write(f"  - **Relevant PR links**: {extract_section(pr_data['body'], 'Relevant PR links', 'Link to docdb')}")
                  #f.write(f"  - **Documentation Links**: {extract_section(pr_data['body'], 'Link to docdb', '')}")
                  f.write(f"  - **Labels**: {', '.join([label['name'] for label in pr_data['labels']])}\n")
                  f.write(f"  - **Reviewers**: {', '.join([reviewer['login'] for reviewer in pr_data['requested_reviewers']])}\n")
                  f.write(f"  - **Assignees**: {', '.join([assignee['login'] for assignee in pr_data['assignees']])}\n")
          print()

def extract_section(body, start_keyword, end_keyword):
    if body is None:
        return ''
    lines = body.split('\n')
    capture = False
    content = []
    for line in lines:
        if start_keyword in line:
            capture = True
        elif end_keyword in line and end_keyword != '':
            break
        elif capture:
            content.append(line.strip())
    return ' '.join(content).replace('#', '').strip()

if __name__ == "__main__":
    GITHUB_TOKEN = #ADD YOUR GITHUB TOKEN
    repositories = {
        'sbndcode': ('v10_04_05', 'v10_04_06_01'),
    }

    for repo, tags in repositories.items():
        fetch_pr_details(repo, tags[0], tags[1], GITHUB_TOKEN)
