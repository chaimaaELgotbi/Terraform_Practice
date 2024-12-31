#!/bin/bash

# Update system and install necessary packages
sudo apt update -y
sudo apt install -y nginx
sudo apt install php8.3-fpm


# Remove the default index.html
sudo rm /var/www/html/index.html

# Create a "Hello World" PHP page
echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
   <meta charset=\"UTF-8\">
   <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
   <title>Nginx Installation</title>
</head>
<body onload=\"script();\">
   <h1>HELLO WORLD!</h1>
   <p><?php echo(\"This server is running on: \".PHP_OS);?></p>
   <p><?php echo php_uname();?></p>
   <strong>Your system is: </strong><p id=\"OS\"></p>
   <script>
      HTMLDocument.prototype.e = document.getElementById;
      var os = document.e(\"OS\");
      var Name = navigator.appVersion;
      window.addEventListener(\"load\", function(){
         os.innerHTML = Name;
      });
   </script>
</body>
</html>
" > /var/www/html/index.php

# Update Nginx configuration to handle PHP (php-fpm)
sudo bash -c 'cat > /etc/nginx/sites-available/default << EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
       include snippets/fastcgi-php.conf;
       fastcgi_pass unix:/run/php/php8.3-fpm.sock;
    }


    location ~ /\.ht {
        deny all;
    }
}
EOF'

# Restart Nginx to apply the new configuration
sudo systemctl restart nginx

# Restart PHP-FPM to ensure it's running
sudo systemctl restart php8.3-fpm

# Check if PHP-FPM service is running
sudo systemctl status php8.3-fpm

# Check the status of Nginx to confirm it's running
sudo systemctl status nginx
