<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reply to Your Inquiry</title>
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
        .content {
            padding: 30px;
        }
        .original-inquiry {
            background: #f9f9f9;
            padding: 15px;
            border-left: 4px solid #0f4c81;
            margin: 20px 0;
        }
        .reply-message {
            background: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 20px 0;
        }
        .footer {
            background: #f9f9f9;
            padding: 20px;
            text-align: center;
            color: #666;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Reply to Your Inquiry</h1>
        </div>
        
        <div class="content">
            <p>Dear {{ $inquiry->name }},</p>
            
            <p>Thank you for your patience. Here is our response to your inquiry:</p>
            
            <div class="reply-message">
                {!! nl2br(e($replyMessage)) !!}
            </div>
            
            <div class="original-inquiry">
                <h4 style="margin-top: 0; color: #0f4c81;">Your Original Inquiry:</h4>
                <p><strong>Subject:</strong> {{ $inquiry->subject }}</p>
                <p><strong>Date:</strong> {{ $inquiry->date_submitted->format('F d, Y') }}</p>
                <p><strong>Your Message:</strong></p>
                <p style="margin: 10px 0; padding: 10px; background: white; border-radius: 3px;">
                    {{ $inquiry->message }}
                </p>
            </div>
            
            <p>If you have any further questions, please don't hesitate to contact us.</p>
            
            <p>Best regards,<br>
            <strong>James Polymers Technical Team</strong><br>
            James Polymers Manufacturing Corporation</p>
        </div>
        
        <div class="footer">
            <p><strong>James Polymers Manufacturing Corporation</strong></p>
            <p>016 Panapaan II, Bacoor City, Cavite, Philippines</p>
            <p>Phone: +63 (2) 8529 8978 | Email: jamespolymers.international@gmail.com</p>
            <p>&copy; {{ date('Y') }} James Polymers. All rights reserved.</p>
        </div>
    </div>
</body>
</html>