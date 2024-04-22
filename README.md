# Documentation and Manauls of Dyne.org products

## Create a new project

Go inside the `src/` folder and use `mkdocs new name_of_project`.

Beware the name you chose will also be in the url `https://dyne.org/docs/name_of_project`.

Go inside the freshly created project folder and use mkdocs as usual, ⚠️⚠️  but never do `mkdocs deploy`


## Publish changes

Go in the root of this repository and do `make deploy`.

If there are no changes in the src files then an error will be returned and no commit created.

Read carefully the errors returned because some warnings contain useful information.


## Further questions

Ask Jaromil or Settoshi
