app = Flask(__name__)
app.config['SECRET_KEY'] = 'your secret key'
initialize_app(app)


# mail information
email_address = 'reminder@pamer.ee'
password = '89882260.a'
# server information
smtp_server = "pamer.ee"
smtp_port = 465
smtp_use_tls = True
mail = Mail(app)
