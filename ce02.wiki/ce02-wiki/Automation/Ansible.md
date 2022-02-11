- Ansible is a solution to automate your IT infrastructure. 
- An organisation has hundreds of systems, so for configuration the same task would be repeated multiple times. This can lead to errors. This is why Ansible is so useful
- Once youve written the Ansible code, it can work with all 3 clouds. 
- Code is written in Yaml, like the pipelines. So indentation and spaces are super important. This also means you can add things into the code, e.g. users, installing software, copying files (just like when we did yaml pipelines and we went into settings and added what we wanted).

- A 'playbook' is just the **yaml** instructions file


#**Commands**

`sudo ansible-playbook localhost.yaml`

Run this command in the wsl terminal to apply the changes you've made to your code

`ansible-playbook localhost.yaml -vv`

Run this command in wsl terminal to get a log of what happened. The above command only executes the changes, it doesnt show them which is what this command does

`---` written at the very top of each file is crucial as this tells the computer ansible is written below. I may be chatting smack, however it is very important so include it.

#Tuesdays Ansible work 

1. [The link to the website which displays all possible things you can do can be found here](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html) e.g. find the yaml code to copy a file, or yaml which includes a python script
2. Git clone Martin's repo and open up VS Code.
2. Make two terminals, left terminal in cmd, right terminal in wsl (windows sub-system for linux)
3. Make sure to `cd` into the location where the files are. (e.g. when you dir, you  see all the individual files)
4. `ls` in right terminal shows you your existing files
5. In localhost.yaml file incude the code below. This creates a directory tmp and CE02, mode is 'user=read write' 'group=write execute' and 'owner=read, write and execute'

![image.png](/.attachments/image-a26134a6-afd7-4221-a65c-85050b540032.png)

7. git pull to get src file containing requirements.txt file and keven bacon python code.

8. Add python into yaml code. Why? Martin was doing it on his computer and that had a different configuration to ours, thats why when we tried to run the requirements.txt, it failed but his worked. Therefore we have to install python 3

![image.png](/.attachments/image-863a017a-f9c9-4592-8d0b-eba30eb6910c.png)

9. Adding more yaml but I cba to add it, but here is the whole lot:

![image.png](/.attachments/image-45115255-c8ae-487a-831e-485f2297354c.png)

10. To make the localhost.yaml re-useable, move all the yaml code into a new file called kb.yaml

# Stuff whilst going through Tuesdays work

below image, localhost.yaml: The tasks is telling it to run local.yaml file and the update.yaml file. If you make more .yaml files e.g. later on we make a kb.yaml, then we also put the kb.yaml file like how its dones below
![image.png](/.attachments/image-8ea33c43-bd06-42b6-80bf-739ac5ba73d2.png)

Below image, locale.yaml: This file tells you what you want to be included or what to be excluded. There may be some things you dont want present on a machine. The code below says you want the community locale to be present on the system (I think its something to do with language)
![image.png](/.attachments/image-1ceca6ed-3588-4f9a-902e-399d73bc4fd4.png)

below image: Normally when you're doing stuff with Ansible, you're doing it through remote connection. However, we are using our local computer, so we dont need that just yet. we're just doing things locally as a beginners tutorial to see where things are.
![image.png](/.attachments/image-0c131de6-7e4b-4f0c-8b2c-bc1aaf8d4b47.png)



# Edgar project Ansible
1. Delete folders which are not necessary (e.g. examples)
2. Add in the template folders which don't really change much e.g. updates.yaml, locale.yaml, localhost.yaml. 
3. create a new file called edgar.yaml, and remember to add this to your localhost.yaml. This is will be the playbook (yaml script)
4. Below is the edgar.yaml code with notes:
**Remember this would all be running on wsl which is kind of like a separate entity to our computer (Like a Virtual Machine). Thats why we need to log in**

```---
#Create a temporary folder to store all edgar resources
- name: ansible create ce02 folder
  file:
    path: /tmp/ce02
    state: directory
    mode: "u=rw,g=wx,o=rwx"

#Copy edgar resources files from windows (our local computer) over to wsl!! 
- name: Copy resource files for edgar
  ansible.builtin.copy:
    src: ./edgar/  #The edgar folder on our local computer
    dest: /tmp/ce02  #The folder in the wsl 

#Create temporary folder to store raw html downloads 
- name: ansible create html folder for edgar
  file:
    path: /tmp/ce02/html
    state: directory
    mode: "u=rw,g=wx,o=rwx"

#Installation of pip to install python package. To make sure we all have python installed and the same version
- name: Install python3-pip  (state=present is optional)
  apt:
    name: python3-pip
    state: present

# pip install packages from the requirements
- name: Install specified python requirements
  pip:
    requirements: /tmp/ce02/requirements.txt

#Run the FASTAPI script
- name: Localhost FastAPI
  shell:
    cmd: uvicorn edgar_api:app --reload --host 127.0.0.1 --port 8000
    chdir: /tmp/ce02/
```

Then in the cmd terminal (not linux) type in `curl http://127.0.0.1:8000/`


# Ansible Set-up
I've put this at the very bottom as we're only doing it once here. 
1. `sudo apt update && sudo apt install software-properties-common`
Then enter in the password you created
2. `sudo add-apt-repository --yes --update ppa:ansible/ansible`
3. `sudo apt install ansible`


<IMG  src="https://i.kym-cdn.com/photos/images/masonry/001/811/508/cf9.png"  alt="What Did You Do To My Drink? | Know Your Meme"/>