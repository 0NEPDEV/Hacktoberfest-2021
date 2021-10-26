import smtplib, ssl
smtpServer = "smtp.gmail.com"
port = 587 
myEmail = "my_email@gmail.com"
password = "my_password" 
#email and password can also be user input fields
context = ssl.create_default_context()
newEmail = """From: From Person <senderMail@sender.com>
To: To Person <my_email@gmail.com>
Subject: Email Test
This is the body of the email.
"""
try:
    server = smtplib.SMTP(smtpServer,port)
    server.starttls(context=context)
    server.login(newEmail, password)
except Exception as e:
    print("the email could not be sent.")
finally:
    server.quit()
