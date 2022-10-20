include(GetGitRevisionDescription)

git_describe_working_tree(GIT_VERSION --tags --dirty=-d)
if(NOT GIT_VERSION)
    message(AUTHOR_WARNING "Invalid git version '${GIT_VERSION}'")
    set(GIT_VERSION "UNKNOWN")
endif()
