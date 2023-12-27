deploy:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml

deploy-password:
    ansible-playbook -i ansible/inventories ansible/playbooks/site.yml --ask-pass --ask-become-pass

lint:
    hadolint Dockerfile
    yamllint ansible/
    ansible-lint

test:
    cd ansible/roles/server_laptop && molecule test
