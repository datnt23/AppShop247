package com.manager.doan247android.retrofit;

import com.manager.doan247android.model.NotiRespone;
import com.manager.doan247android.model.NotiSendData;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;


public interface ApiPushNofication {
    @Headers(
            {
                    "Content-Type:application/json",
                    "Authorization: key=AAAAXyr6MEk:APA91bHv3sl96E26JT-M8q41UP2cFZoYrQGZuRPtGoKE9zMNzKpZTR2g8uWbaDvqv6-fvKGrefBOU5tqENzfizKWeSBsP7CD4iPaYrfGzZ9mHM04eO4XEW_YIUmD9tyIWzdYs4EsDTo4"
            }
    )
    @POST("fcm/send")
    Observable<NotiRespone> sendNofitication(@Body NotiSendData data);
}
