# Step 1: Install Java
echo "Step 1: Install Java"
sudo apt-get update
sudo apt install openjdk-17-jre -y

#Step 2: Add Jenkins repository
echo "Step 2: Add Jenkins repository"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install ca-certificates
sudo apt update

#Step 3: Install Jenkins
echo "Step 3: Install Jenkins"
sudo apt install jenkins -y

#Step 4: Start Jenkins
echo "Step 4: Start Jenkins"
sudo systemctl start jenkins
sudo systemctl status jenkins

#Step 5: Intall Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform