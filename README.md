# Ansible parallel execution script

Use `ansible-parallel -h` to see available options. Features of bash script:

- Runs playbooks in parallel!
- Shows filtered logs with only errors and changes for easier readability!
- Easily target specific playbooks using playbooks names or string matches!
- Specify directory to run from!
- Pull the latest of specified branch for runs!
- Use `ansible-playbook` arguments!
- Use specific branches for runs!
- Skip unreachable hosts!
- Run a post exit script!

Note: The binary uses the executors current directory if `ansible.cfg` exists in said current directory as a root for playbooks and roles. Otherwise it will use the default path, if `ansible.cfg` exists there, will fail if both do not exist.

## Usage Examples

```bash
# Run nsswitch role on base in check mode
ansible-parallel -p cluster_base --tags nsswitch --check --diff -v
# Run software updates on all cluster nodes
ansible-parallel -m cluster --tags soft
```

## Configuration file

`ansible-parallel` supports configuration file options. Example in `ansible-parallel.cfg`, explained in more detail:

```bash
# Prefixes to search for when running playbooks by name
PREFIXES="group_,host_"
# Log dir relative to repo root
RELATIVE_LOG_PATH=logs
# Hosts inventory path relative to repo root
RELATIVE_INVENTORY_PATH=hosts
# Temp dir path relative to repo root
RELATIVE_TMP_PATH=tmp
# Git URL to use for pulling repo
ANSIBLE_REPO_URL=git@gitlab.ee:hpc/ansible/ansible-mono.git
# Default main dir to use if not using current directory
ANSIBLE_MAIN_DIR=/opt/ansible-mono
# Default branch to use when branch is not specified as argument
DEFAULT_BRANCH=master
# Command to run after exiting, send teams message or mail etc
POST_RUN_COMMAND="~/ansible-parallel/teams-msg <WEBHOOK_URL> 'Message title for ansible run' 000000 \$output_path"
```
