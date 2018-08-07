# About this repository [![Build Status](https://travis-ci.org/psadmin-io/psadmin-wiki.svg?branch=master)](https://travis-ci.org/psadmin-io/psadmin-wiki)

This is the GitHub repo for the psadmin.io Community Wiki (<http://wiki.psadmin.io>). The Community Wiki is a place for PeopleSoft Administrators to share documentation on setting up new features, how they resolved issues, and anything else they would like to share.

## How to contribute with GitHub

Anyone can contribute to the Communtiy Wiki. To make a contribution or edit, you can use the GitHub online editing tools to modify existing posts or create new posts.

**To edit an existing document:**

1. Open the page in the repository and click the pencil icon. 
1. When you are done editing the document, add a commit comment and select "Create a new branch for this commit and start a pull request." You can change the branch name to something descriptive.
1. Click the "Propose file change" button.
1. On the Pull Request page, click the "Create pull request" button to submit your change for inclusion.

**To add a new document:**

1. Open the folder where you want to create the file and click the "Create new file" button.
1. Add file name (use underscores for spaces) with the `.md` extension.
1. At the top of the new document, add the front-matter:

        ```
        ---
        title: Sample Title
        layout: en
        permalink: /posts/folder/sample_title/
        ---
        ```
1. Add your title to the front-matter section.
1. Modify the `folder` and `sample_title` in the permalink section to match the folder and your filename.
1. When you are done creating and editing the document, add a commit comment and select "Create a new branch for this commit and start a pull request." You can change the branch name to something descriptive.
1. Click the "Propose file change" button.
1. On the Pull Request page, click the "Create pull request" button to submit your change for inclusion.

**Publishing your changes**

GitHub will test your changes with the wiki to ensure the wiki builds successfully. When the test has completed, a wiki administrator will approve your changes into the `master` branch. Commits to the `master` branch will trigger a new wiki build and update the site `wiki.psadmin.io` in a few minutes.

## How to contribute from a local Git repo

Anyone can contribute to the Communtiy Wiki. To make a contribution or edit from a local copy of the repository, you'll need Git installed. It's also recommended you use a good text editor (like SublimeText, VS Code, Notepad++, vi) and are familiar with [Markdown formatting](https://guides.github.com/features/mastering-markdown/). 

### Clone the wiki git repository

To add your change, use Git to clone this repository to your local machine:

    git clone https://github.com/psadmin-io/psadmin-wiki.git

This will copy the repositiory to the folder `psadmin-wiki`. 

### Create a new branch

Next, open the repository and create a new branch:

    cd psadmin-wiki
    git checkout -b <your-branch-name>

For your branch name, use something descriptive so people know what the branch contains. (E.g, `update-README`, `push-notification-install`, etc)

### Add your article

All the wiki articles live under the `posts` folder, and are organized into a few sections. Put your file under the section that most applies to the topic you are contributing. Under each section is an OVERVIEW articles with guidelines on what the topics are included.

* PeopleTools
* Database
* Middleware
* PeopleSoft Cloud Architecture
* Server Administration
* Development

Now you can use your text editor to add a new article. For example, we'll add a new article that shows a sample `psft_customizations.yaml` file under the *PeopleSoft Cloud Architecure* section. I'll create a new file with VS Code:

     code posts/pca/sample_yaml.md

#### Front-data

At the top of every wiki article is some YAML data that tells the wiki how to render the document.

    ---
    title: Sample psft_customizations.yaml
    layout: en
    permalink: /posts/pca/sample_yaml/
    ---

Update the title and permalink values. For the `permalink`value, use the convention `/posts/<section>/<filename>/` The permalink will be the URL to the wiki page.

#### Wiki article

Start the wiki article with a heading (two `##`) and the title. Everything after here is the article. You can use Markdown formatting throughout the article to create code blocks, headings, lists, etc.

    ## Sample psft_customizations.yaml File

    Below is a sample `psft_customizations.yaml` file to give you an idea of how to define configuration for the DPK.

#### Gists

You can include GitHub gists if you want. Copy the code below and replace the `src=` with the link to your Gist.

    <script src="https://gist.github.com/iversond/0c096258ffe2d624d1c64b8aaffad846.js"> </script>

### Create a git commit

Once your article is done and added to the sidebar, create a Git commit for your chagnes.

    git add .
    git status 

Make sure everything you changed is added to the commit.

    git commit -m "Added sample `psft_customizations.yaml` article"

Then, push your changes up to GitHub so they can be reviewed before merging into the master wiki branch.

    git push origin <your-branch-name>

### Create a pull request

GitHub has an excellent Pull Request (PR) feature where you can submit changes to the wiki. The PR will be submited for review and the wiki changes will be tested to make sure nothing in the wiki broke.

1. In GitHub, open the repository page for the wiki, click on the *Pull Requests* tab and select *Create Pull Request*.
1. Select `master` as the base, and `<your-branch-name>` as the compare.
1. Click the *Create Pull Request* button submit it for review.
1. Add a title and fill out a description of the changes you made.
1. Click *Create Pull Request* to finish the PR.

After submitting the PR, the wiki branch you submitted will be pulled into a Travis-CI test build. If there are errors with the build, the results are displayed on the PR page. If the test build succeeded, the PR page will show a successful test.

A wiki administration will review the PR and merge the branch into `master` if there are no issues.

## How to check your edits before sending PR

You can inspect how your edits will be reflected on the published wiki if you want to view the changes before submitting a PR. 

### Install dependencies

1. Make sure you have Ruby and RubyGems installed.

1. Install [bundler](http://bundler.io/):

    ```sh-session
    $ gem install bundler
    ```

1. Install application dependencies:

    ```sh-session
    $ bundle install --binstubs
    ```

### Run the Jekyll application server

You are now ready to start your documentation site, using Jekyll or Puma.
For documentation edits, Jekyll is sufficient.

#### Starting and inspecting edits with Jekyll

1. Run Jekyll server:

    ```sh-session
    $ rake
    $ bundle exec jekyll serve
    ```

1. Open [localhost:4000](http://localhost:4000/) in your browser.

