# Zip and Unzip directories

A set of Build tasks Azure Pipelines that enables you to Zip and Unzip a directories.

## Documentation

### Zip task

In the zip task you are able to zip multiple folders to a zip files. The task creates zip archives with the name of the folder:

> src/project/Modules/Common => src/project/Modules/Common.zip

In your next build step you can publish or copy the zip file to your destination location.

![zip sample](https://pgroene.files.wordpress.com/2016/05/vsts-zip-zip.png?w=840 "Common use of zip task")

### Unzip task

In the unzip task you are able to unzip zip files. In the ‘Zip files to unzip’ textbox you can specify multiple files to unzip. When the ‘Unzip to path’ is empty, the files will be unziped into a sub directory with the same name as the zip file.

> src/project/Modules/Common.zip => src/project/Modules/Common

When you specify the ‘Unzip to path’ textbox, the zip files will be unzipped into that directory.

![unzip sample](https://pgroene.files.wordpress.com/2016/05/vsts-zip-unzip.png?w=840 "Common use of unzip task")

### Add path variables

The default relative path is the folder where all sources for the build definition are synced. You can go thought other directories/files on the build agent by using full paths or variables in the path. All input boxes for paths do accept variables. For example the source directory is: $(Agent.BuildDirectory)\s. Or use your own variables for the build/release pipeline in the paths.

![variables](https://pgroene.files.wordpress.com/2016/05/vsts-zip-zip-variables.png?w=840 "The use of variables")

### Path variables in VSTS

More on variables can be found at: [MSDN Use variables](https://www.visualstudio.com/en-us/docs/build/define/variables)

## More inforamtion

[Get started](https://pgroene.wordpress.com/2016/05/28/using-the-vsts-directory-zip-and-unzip-task/)

[My blog for other build and release information](https://pgroene.wordpress.com)
