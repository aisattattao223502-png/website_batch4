<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You for Contacting Us</title>
    <style>
        body { 
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
            line-height: 1.6; 
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container { 
            max-width: 600px; 
            margin: 20px auto; 
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header { 
            background-color: #0f4c81; 
            color: white; 
            padding: 30px 20px; 
            text-align: center; 
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .content { 
            padding: 30px 20px; 
        }
        .summary-box {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .summary-box h3 {
            margin-top: 0;
            color: #0f4c81;
        }
        .summary-item {
            margin-bottom: 10px;
        }
        .summary-label {
            font-weight: 600;
            color: #666;
        }
        .contact-info {
            background-color: #e8f4f8;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .footer { 
            background-color: #f9f9f9;
            text-align: center; 
            padding: 20px; 
            color: #666; 
            font-size: 13px; 
        }
        .footer a {
            color: #0f4c81;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>✓ Thank You for Contacting Us</h1>
        </div>
        <div class="content">
            <p>Dear <strong>{{ $inquiry->name }}</strong>,</p>

            <p>Thank you for reaching out to <strong>James Polymers Manufacturing Corporation</strong>. We have successfully received your inquiry and our team will review it shortly.</p>

            <div class="summary-box">
                <h3>📋 Your Inquiry Details</h3>
                <div class="summary-item">
                    <span class="summary-label">Subject:</span> {{ $inquiry->subject }}
                </div>
                <div class="summary-item">
                    <span class="summary-label">Priority:</span> {{ ucfirst($inquiry->priority) }}
                </div>
                <div class="summary-item">
                    <span class="summary-label">Submitted:</span> {{ $inquiry->date_submitted->format('F j, Y \a\t g:i A') }}
                </div>
            </div>

            <p>We typically respond to inquiries within <strong>24-48 hours</strong> during business days (Monday - Friday, 8:00 AM - 5:00 PM).</p>

            <div class="contact-info">
                <p style="margin: 0; font-weight: 600;">📞 Need Immediate Assistance?</p>
                <p style="margin: 5px 0 0 0;">If your inquiry is urgent, please call us at <strong>+63 (2) 8529 8978</strong></p>
            </div>

            <p>Best regards,<br>
            <strong>The James Polymers Team</strong></p>
        </div>
        <div class="footer">
            <p style="margin: 0 0 10px 0;"><strong>James Polymers Manufacturing Corporation</strong></p>
            <p style="margin: 0;">016 Panapaan II, Bacoor City, Cavite, Philippines</p>
            <p style="margin: 5px 0;">
                📧 <a href="mailto:jamespolymers.international@gmail.com">jamespolymers.international@gmail.com</a> | 
                📞 +63 (2) 8529 8978
            </p>
        </div>
    </div>
</body>
</html>