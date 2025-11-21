<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Contact Inquiry</title>
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
        .field { 
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        .field:last-child {
            border-bottom: none;
        }
        .label { 
            font-weight: 600; 
            color: #0f4c81;
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .value {
            color: #333;
            font-size: 16px;
        }
        .message-box {
            background-color: #f9f9f9;
            padding: 15px;
            border-left: 4px solid #0f4c81;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
        .priority-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .priority-high { 
            background-color: #dc3545; 
            color: white;
        }
        .priority-medium { 
            background-color: #ffc107; 
            color: #333;
        }
        .priority-low { 
            background-color: #28a745; 
            color: white;
        }
        .button { 
            display: inline-block; 
            padding: 12px 24px; 
            background-color: #0f4c81; 
            color: white !important; 
            text-decoration: none; 
            border-radius: 5px; 
            margin-top: 20px;
            font-weight: 600;
        }
        .button:hover {
            background-color: #0a3660;
        }
        .footer {
            background-color: #f9f9f9;
            padding: 20px;
            text-align: center;
            color: #666;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔔 New Contact Inquiry</h1>
        </div>
        <div class="content">
            <div class="field">
                <span class="label">Priority Level</span>
                <span class="priority-badge priority-{{ $inquiry->priority }}">
                    {{ strtoupper($inquiry->priority) }}
                </span>
            </div>

            <div class="field">
                <span class="label">Full Name</span>
                <span class="value">{{ $inquiry->name }}</span>
            </div>

            <div class="field">
                <span class="label">Email Address</span>
                <span class="value">
                    <a href="mailto:{{ $inquiry->email }}" style="color: #0f4c81; text-decoration: none;">
                        {{ $inquiry->email }}
                    </a>
                </span>
            </div>

            <div class="field">
                <span class="label">Phone Number</span>
                <span class="value">
                    <a href="tel:{{ $inquiry->phone }}" style="color: #0f4c81; text-decoration: none;">
                        {{ $inquiry->phone }}
                    </a>
                </span>
            </div>

            @if($inquiry->company)
            <div class="field">
                <span class="label">Company Name</span>
                <span class="value">{{ $inquiry->company }}</span>
            </div>
            @endif

            @if($inquiry->position)
            <div class="field">
                <span class="label">Position</span>
                <span class="value">{{ $inquiry->position }}</span>
            </div>
            @endif

            <div class="field">
                <span class="label">Company Address</span>
                <span class="value">{{ $inquiry->address }}</span>
            </div>

            <div class="field">
                <span class="label">Subject</span>
                <span class="value">{{ $inquiry->subject }}</span>
            </div>

            <div class="field">
                <span class="label">Message</span>
                <div class="message-box">{{ $inquiry->message }}</div>
            </div>

            <div class="field">
                <span class="label">Submitted On</span>
                <span class="value">{{ $inquiry->date_submitted->format('F j, Y') }} at {{ $inquiry->date_submitted->format('g:i A') }}</span>
            </div>

            <div style="text-align: center; padding-top: 20px;">
                <a href="{{ url('/admin/inquiries') }}" class="button">
                    View in Admin Panel →
                </a>
            </div>
        </div>
        <div class="footer">
            <p style="margin: 0;">This is an automated notification from James Polymers contact form.</p>
        </div>
    </div>
</body>
</html>