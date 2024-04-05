k8s_yaml('k8s/express-secret.yaml')
k8s_yaml('k8s/express-config.yaml')

docker_build(
    'k8s-express-tryout',
    context='.',
    dockerfile='./Dockerfile',
    build_args={'node_env': 'development'},
    entrypoint='npx nodemon index.js',
    only=['index.js', 'package.json', 'package-lock.json'],
    live_update=[
        sync('index.js', '/usr/app/index.js'),
    ]
)

k8s_yaml('k8s/express.yaml')
k8s_resource('express-deployment')

local_resource('cp express-package.json',
cmd='POD=$(kubectl get pod -l app=express -o name | sed "s/^.\\{4\\}//") && kubectl cp $POD:/usr/app/package.json package.json && kubectl cp $POD:/usr/app/package-lock.json package-lock.json',
auto_init=False, trigger_mode=TRIGGER_MODE_MANUAL)