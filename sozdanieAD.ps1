# ustanovka AD 
# prosmotr vsex vozmoznix variantov/spisok
get-windowsfeature

# ustanovka AD komandoi
install-windowsfeature AD-Domain-Services

# sozdaybt Web-Server
install-windowsfeature Web-Server



#proverka pabotosposobnosni AD
Get-ADUser -Identity администратор -Properties *