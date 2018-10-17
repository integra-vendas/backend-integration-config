# load envionment variables
. .env

# set of services
directories=('login' 'api-gateway' 'product' 'order')
branches=($LOGIN $API_GATEWAY $PRODUCT $ORDER)
remotes=('https://github.com/fga-eps-mds/2018.2-FGAPP-login' \
        'https://github.com/fga-eps-mds/2018.2-iFood' \
        'https://github.com/fga-eps-mds/2018.2-FGAPP-produto' \
        'https://github.com/fga-eps-mds/2018.2-FGAPP-vendas')

function updateAll() {
    ## Update
    for i in 0 1 2 3
    do
        echo '\n'
        # Local variables
        dir=${directories[$i]}
        remote=${remotes[$i]}
        branch=${branches[$i]}

        echo 'Updating ' $dir '->' $branch

        # Clone repositories if necessary
        if [ ! -d $dir ]; then
            git clone $remote $dir -b $branch
        fi

        # Move to directory
        cd $dir
        current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
        git pull
        # Check current branch and checkout if necessary
        if [ ! current_branch = branch ]; then
            git checkout $branch
            git pull
        fi

        cd ..
        echo '\n'
    done
}

function runAll() {
    for i in 0 1 2 3
    do
        echo '\n'
        # Local variables
        dir=${directories[$i]}
        (cd $dir && make &)
    done
}

if [ $1 = 'run' ]; then
    runAll
fi

if [ $1 = 'update' ]; then
    updateAll
fi
