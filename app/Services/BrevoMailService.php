<?php

namespace App\Services;

use SendinBlue\Client\Configuration;
use SendinBlue\Client\Api\TransactionalEmailsApi;
use SendinBlue\Client\Model\SendSmtpEmail;
use Illuminate\Support\Facades\Log;

class BrevoMailService
{
    protected $apiInstance;

    public function __construct()
    {
        $config = Configuration::getDefaultConfiguration()->setApiKey('api-key', config('services.brevo.api_key'));
        $this->apiInstance = new TransactionalEmailsApi(new \GuzzleHttp\Client(), $config);
    }

    public function sendEmail($to, $toName, $subject, $htmlContent, $replyTo = null)
    {
        try {
            $sendSmtpEmail = new SendSmtpEmail([
                'sender' => [
                    'name' => config('mail.from.name'),
                    'email' => config('mail.from.address')
                ],
                'to' => [[
                    'email' => $to,
                    'name' => $toName
                ]],
                'subject' => $subject,
                'htmlContent' => $htmlContent
            ]);

            if ($replyTo) {
                $sendSmtpEmail->setReplyTo([
                    'email' => $replyTo['email'],
                    'name' => $replyTo['name'] ?? ''
                ]);
            }

            $result = $this->apiInstance->sendTransacEmail($sendSmtpEmail);
            Log::info('Brevo email sent successfully', ['messageId' => $result->getMessageId()]);
            return true;

        } catch (\Exception $e) {
            Log::error('Brevo email failed: ' . $e->getMessage());
            throw $e;
        }
    }
}