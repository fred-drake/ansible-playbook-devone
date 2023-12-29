deploy-all:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml

deploy HOST:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml --limit {{ HOST }}

deploy-all-password:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml --ask-pass --ask-become-pass

deploy-password HOST:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml --limit {{ HOST }} --ask-pass --ask-become-pass

lint:
    hadolint Dockerfile
    yamllint ansible/
    ansible-lint

test:
    cd ansible/roles/server_laptop && molecule test
