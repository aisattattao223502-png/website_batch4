<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Contact Form Submission</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
    <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
        <h2 style="color: #0f4c81; border-bottom: 3px solid #f7931e; padding-bottom: 10px;">
            New Contact Form Submission
        </h2>
        
        <div style="background-color: #f9f9f9; padding: 20px; border-radius: 5px; margin: 20px 0;">
            <p><strong>Priority:</strong> <span style="color: {{ $data['priority'] === 'high' ? 'red' : ($data['priority'] === 'medium' ? 'orange' : 'green') }};">{{ strtoupper($data['priority']) }}</span></p>
            <p><strong>Subject:</strong> {{ $data['subject'] }}</p>
        </div>
        
        <h3 style="color: #0f4c81;">Contact Information:</h3>
        <table style="width: 100%; border-collapse: collapse;">
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Name:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ $data['fullName'] }}</td>
            </tr>
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Email:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ $data['email'] }}</td>
            </tr>
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Phone:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ $data['phone'] }}</td>
            </tr>
            @if($data['companyName'])
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Company:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ $data['companyName'] }}</td>
            </tr>
            @endif
            @if($data['position'])
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Position:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ ucfirst($data['position']) }}</td>
            </tr>
            @endif
            <tr>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><strong>Address:</strong></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">{{ $data['companyAddress'] }}</td>
            </tr>
        </table>
        
        <h3 style="color: #0f4c81; margin-top: 20px;">Message:</h3>
        <div style="background-color: #f9f9f9; padding: 15px; border-left: 4px solid #0f4c81; border-radius: 3px;">
            {{ $data['message'] }}
        </div>
        
        <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #ddd; text-align: center; color: #777; font-size: 12px;">
            <p>This email was sent from the James Polymers website contact form.</p>
            <p>© {{ date('Y') }} James Polymers Manufacturing Corporation</p>
        </div>
    </div>
</body>
</html>