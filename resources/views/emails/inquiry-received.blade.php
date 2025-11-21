<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background: #0f4c81; color: white; padding: 20px; text-align: center; }
        .content { background: #f9f9f9; padding: 30px; border: 1px solid #ddd; }
        .footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }
        .info-row { margin: 10px 0; }
        .label { font-weight: bold; color: #0f4c81; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thank You for Contacting Us!</h1>
        </div>
        
        <div class="content">
            <p>Dear {{ $inquiry->name }},</p>
            
            <p>We have successfully received your inquiry and appreciate you reaching out to James Polymers Manufacturing Corporation.</p>
            
            <h3>Your Inquiry Details:</h3>
            
            <div class="info-row">
                <span class="label">Subject:</span> {{ $inquiry->subject }}
            </div>
            <div class="info-row">
                <span class="label">Priority:</span> {{ ucfirst($inquiry->priority) }}
            </div>
            <div class="info-row">
                <span class="label">Message:</span><br>
                {{ $inquiry->message }}
            </div>
            
            <p style="margin-top: 20px;">Our team will review your inquiry and respond within 24-48 business hours.</p>
            
            <p>If you have any urgent concerns, please contact us directly at:<br>
            <strong>Phone:</strong> +63 (2) 8529 8978<br>
            <strong>Email:</strong> jamespolymers.international@gmail.com</p>
        </div>
        
        <div class="footer">
            <p>&copy; {{ date('Y') }} James Polymers Manufacturing Corporation. All rights reserved.</p>
            <p>016 Panapaan II, Bacoor City, Cavite, Philippines</p>
        </div>
    </div>
</body>
</html>