deploy-all:
    ansible-playbook -i ./inventories playbooks/site.yml

deploy HOST:
    ansible-playbook -i ./inventories playbooks/site.yml --limit {{ HOST }}

deploy-all-password:
    ansible-playbook -i ./inventories playbooks/site.yml --ask-pass --ask-become-pass

deploy-password HOST:
    ansible-playbook -i./inventories playbooks/site.yml --limit {{ HOST }} --ask-pass --ask-become-pass

lint:
    yamllint .
    ansible-lint

test:
    cd roles/server_laptop && molecule test

deps:
    pip install -r dev-requirements.txt
    ansible-galaxy install -r galaxy-requirements.yml --force
