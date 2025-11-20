<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inquiry Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .header {
            background: #0f4c81;
            color: #fff;
            padding: 30px;
            text-align: center;
        }
        .logo {
            max-width: 200px;
            margin-bottom: 10px;
        }
        .content {
            padding: 30px;
        }
        .highlight-box {
            background: #f0f7ff;
            border-left: 4px solid #0f4c81;
            padding: 15px;
            margin: 20px 0;
        }
        .info-section {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .info-row {
            margin-bottom: 10px;
        }
        .info-label {
            font-weight: bold;
            color: #0f4c81;
        }
        .footer {
            background: #f9f9f9;
            padding: 20px;
            text-align: center;
            color: #666;
            font-size: 12px;
        }
        .contact-info {
            margin: 15px 0;
            padding: 15px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thank You for Contacting Us!</h1>
        </div>
        
        <div class="content">
            <p>Dear {{ $inquiry->name }},</p>
            
            <p>Thank you for reaching out to James Polymers Manufacturing Corporation. We have successfully received your inquiry and our team will review it shortly.</p>
            
            <div class="highlight-box">
                <strong>What happens next?</strong>
                <ul style="margin: 10px 0; padding-left: 20px;">
                    <li>Our technical team will review your inquiry</li>
                    <li>We aim to respond within 24-48 business hours</li>
                    <li>You'll receive a detailed response to your email</li>
                </ul>
            </div>
            
            <div class="info-section">
                <h3 style="margin-top: 0; color: #0f4c81;">Your Inquiry Details:</h3>
                
                <div class="info-row">
                    <span class="info-label">Reference Number:</span>
                    <span>#INQ-{{ str_pad($inquiry->id, 6, '0', STR_PAD_LEFT) }}</span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Subject:</span>
                    <span>{{ $inquiry->subject }}</span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Priority:</span>
                    <span>{{ ucfirst($inquiry->priority) }}</span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Date Submitted:</span>
                    <span>{{ $inquiry->date_submitted->format('F d, Y h:i A') }}</span>
                </div>
                
                <div class="info-row" style="margin-top: 15px;">
                    <span class="info-label">Your Message:</span>
                    <p style="margin: 5px 0; padding: 10px; background: white; border-radius: 3px;">
                        {{ $inquiry->message }}
                    </p>
                </div>
            </div>
            
            <div class="contact-info">
                <h3 style="margin-top: 0; color: #0f4c81;">Need Immediate Assistance?</h3>
                <p style="margin: 5px 0;">
                    <strong>Phone:</strong> +63 (2) 8529 8978<br>
                    <strong>Email:</strong> jamespolymers.international@gmail.com<br>
                    <strong>Address:</strong> 016 Panapaan II, Bacoor City, Cavite, Philippines
                </p>
                <p style="margin: 10px 0 0 0;">
                    <strong>Business Hours:</strong><br>
                    Monday - Friday: 8:00am - 5:00pm<br>
                    Saturday - Sunday: Closed
                </p>
            </div>
            
            <p>We appreciate your interest in our polymer solutions and look forward to serving you.</p>
            
            <p>Best regards,<br>
            <strong>James Polymers Technical Team</strong><br>
            James Polymers Manufacturing Corporation</p>
        </div>
        
        <div class="footer">
            <p><strong>James Polymers Manufacturing Corporation</strong></p>
            <p>016 Panapaan II, Bacoor City, Cavite, Philippines</p>
            <p>Phone: +63 (2) 8529 8978 | Email: jamespolymers.international@gmail.com</p>
            <p>&copy; {{ date('Y') }} James Polymers. All rights reserved.</p>
            <p style="margin-top: 10px; font-size: 11px;">
                This email was sent to {{ $inquiry->email }} because you submitted an inquiry through our website.
            </p>
        </div>
    </div>
</body>
</html>