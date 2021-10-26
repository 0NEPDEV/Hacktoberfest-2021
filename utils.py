
from django.core.mail import EmailMessage

class utils:
    @staticmethod
    def send_mail(data):
        email = EmailMessage(subject=data['subject'], body=data['email_body'], from_email="yogeshkattel66#gmail.com",to= [data['to_email']])
        email.send()