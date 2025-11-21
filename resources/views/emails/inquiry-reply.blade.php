<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background: #0f4c81; color: white; padding: 20px; text-align: center; }
        .content { background: #f9f9f9; padding: 30px; border: 1px solid #ddd; }
        .footer { text-align: center; padding: 20px; color: #666; font-size: 12px; }
        .original-inquiry { background: #e5e7eb; padding: 15px; margin-top: 20px; border-left: 4px solid #0f4c81; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Response to Your Inquiry</h2>
        </div>
        
        <div class="content">
            <p>Dear {{ $inquiry->name }},</p>
            
            <p>Thank you for your patience. Here is our response to your inquiry:</p>
            
            <div style="margin: 20px 0; padding: 20px; background: white; border: 1px solid #ddd;">
                {!! nl2br(e($replyMessage)) !!}
            </div>
            
            <div class="original-inquiry">
                <p><strong>Your Original Inquiry:</strong></p>
                <p><strong>Subject:</strong> {{ $inquiry->subject }}</p>
                <p><strong>Message:</strong><br>{{ $inquiry->message }}</p>
            </div>
            
            <p style="margin-top: 20px;">If you have any additional questions, please don't hesitate to contact us.</p>
            
            <p>Best regards,<br>
            <strong>James Polymers Manufacturing Corporation</strong><br>
            Phone: +63 (2) 8529 8978<br>
            Email: jamespolymers.international@gmail.com</p>
        </div>
        
        <div class="footer">
            <p>&copy; {{ date('Y') }} James Polymers Manufacturing Corporation</p>
        </div>
    </div>
</body>
</html>