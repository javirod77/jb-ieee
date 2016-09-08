Jeykll with Materialize Site Builder
Dependencies

You will need Ruby and Jekyll.

Note: The commands/scripts I will run are Unix commands. If you're using Windows, there should be equivalent commands that do the same things.
Basics

To preview the site, as it is right now:

    ./serve.sh

Then, in your browser, go to localhost:4000 to see the site. As you modify the *.md files (which contain the contents of the site), your browser will show the latest changes if you refresh the page you are viewing.
Changes to the _config.yml file will require you to hit Ctl+C and rerun the command jekyll serve --watch

   build the site (i.e. create static HTML/CSS files) that you can scp onto your own server:

    ./build.sh

You will now have the static site files in _site. Unless your website will be in a subfolder (explained below), you can preview how your html files will look once they're up on your site using the following:

  cd _site
  python -m SimpleHTTPServer

In your browser, head over to localhost:8000 and you'll see the preview of your site. If you're missing

To configure the site to your own server: Go to _config.yml. Find the line that begins with production_url and place your production URL here. It will look like this:

production_url : http://example.com/subfolder/

If your site will not be in a subfolder/subdomain on your server, remove the subfolder/ portion.
Next, in _config.yml find the line that begins

BASE_PATH: false

Replace the false with /subfolder/ if applicable.

To automatically deploy the site using a convenient script, open up the deploy file. First, remove the following line from the file:

   scp -r _site/* mosakhi@sakhi.es:/home/mosakhi/public_html/osama/

Next, copy the line above it, removing the comment. This will ssh into your site, and copy the build files from _site into the given path you provide. You will modify the line below and modify as described:

   # scp -r _site/* user@example.com:/path/to/root/site/

Replace user@example.com with the login you normally use to ssh into your site/server. Then, replace /path/to/root/site with the actual path at which your site files go. So in my example, my path was /home/mosakhi/public_html/osama/, so the files I'd place here would show at sakhi.es/osama.

Once you've configured deploy.sh, run it when you're ready to upload the site:

   ./deploy.sh

Modifying

Most of the files are auto-generated using a template written in HTML. You can find it in _includes/themes/materialize/default.html. To modify the global site author name, title, etc, find the appropriate fields in _config.yml. To modify content, directly edit index.md, contact.md, blog.md, projects.md as html or markdown. As you add new .md files, they'll also show on the site as html files.
Posts

To create a blog post, run the provided script:

   ./create_post.sh

If you're trying to run one of the four scripts written (build.sh, serve.sh, create_post.sh or deploy.sh) and you get an error regarding permissions, you most likely don't have the permissions needed to execute the scripts. Run the following command to fix it:

chmod +x script.sh

    Contact GitHub API Training Shop Blog About 

    © 2016 GitHub, Inc. Terms Privacy Security Status Help 

