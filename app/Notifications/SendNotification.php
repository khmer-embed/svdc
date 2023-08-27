<?php
namespace App\Notifications;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramMessage;
class SendNotification extends Notification
{
   use Queueable;
   private $info;
   public function __construct($info=[])
   {
       //
       $this->info= $info;
   }   
   
   public function via($notifiable)
   {
      return ['telegram'];
   }
public function toTelegram($notifiable)
   {
      $content = null;
      $arr_info = array_except($this->info, ['url']);

      foreach($arr_info as $key => $info){
         if(!empty($info)){
            // $info = str_replace('"', "-", $info);
            // $key = str_replace('_', "-", $key);
            $str = "\n" . $info[0]." : ". $info[1];
            if(!$content){
               $content = $str;
            }
            else{
               $content .= $str;
            }
         }
         
      }

      $url = $this->info['url']??['',''];
      $str = "\n" . $url[0]." : ". $url[1];
      $content .= $str;
      
      // $content = urlencode($content);
      
      // dd($content);
      if(!empty(config('sysconfig.telegramid'))){
         return TelegramMessage::create()
          ->to(config('sysconfig.telegramid'))
          ->content("KOBO New Record")
         //  ->line("Your invoice has been *PAID*")
          ->line($content)
          ;
      }
      
   }
}