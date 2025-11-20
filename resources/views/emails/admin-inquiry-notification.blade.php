<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Inquiry Notification</title>
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
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header {
            background: #0f4c81;
            color: #fff;
            padding: 20px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }
        .priority-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 3px;
            font-weight: bold;
            font-size: 12px;
            text-transform: uppercase;
        }
        .priority-high {
            background-color: #ff5252;
            color: white;
        }
        .priority-medium {
            background-color: #ffab40;
            color: white;
        }
        .priority-low {
            background-color: #4caf50;
            color: white;
        }
        .content {
            padding: 20px;
        }
        .info-row {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .info-label {
            font-weight: bold;
            color: #0f4c81;
            display: inline-block;
            width: 150px;
        }
        .info-value {
            color: #333;
        }
        .message-box {
            background: #f9f9f9;
            padding: 15px;
            border-left: 4px solid #0f4c81;
            margin-top: 15px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            color: #666;
            font-size: 12px;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #0f4c81;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>New Inquiry Received</h1>
            <span class="priority-badge priority-{{ $inquiry->priority }}">
                {{ strtoupper($inquiry->priority) }} PRIORITY
            </span>
        </div>
        
        <div class="content">
            <p>You have received a new inquiry from the James Polymers website:</p>
            
            <div class="info-row">
                <span class="info-label">Name:</span>
                <span class="info-value">{{ $inquiry->name }}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">Email:</span>
                <span class="info-value">{{ $inquiry->email }}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">Phone:</span>
                <span class="info-value">{{ $inquiry->phone }}</span>
            </div>
            
            @if($inquiry->company)
            <div class="info-row">
                <span class="info-label">Company:</span>
                <span class="info-value">{{ $inquiry->company }}</span>
            </div>
            @endif
            
            @if($inquiry->position)
            <div class="info-row">
                <span class="info-label">Position:</span>
                <span class="info-value">{{ $inquiry->position }}</span>
            </div>
            @endif
            
            <div class="info-row">
                <span class="info-label">Company Address:</span>
                <span class="info-value">{{ $inquiry->company_address }}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">Subject:</span>
                <span class="info-value">{{ $inquiry->subject }}</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">Date Submitted:</span>
                <span class="info-value">{{ $inquiry->date_submitted->format('F d, Y h:i A') }}</span>
            </div>
            
            <div class="message-box">
                <strong>Message:</strong>
                <p>{{ $inquiry->message }}</p>
            </div>
            
            <div style="text-align: center;">
                <a href="{{ url('/admin/inquiries') }}" class="button">View in Admin Panel</a>
            </div>
        </div>
        
        <div class="footer">
            <p>This is an automated notification from James Polymers Manufacturing Corporation</p>
            <p>&copy; {{ date('Y') }} James Polymers. All rights reserved.</p>
        </div>
    </div>
</body>
</html>