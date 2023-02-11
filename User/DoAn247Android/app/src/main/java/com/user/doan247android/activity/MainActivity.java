package com.user.doan247android.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.bumptech.glide.Glide;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.messaging.FirebaseMessaging;
import com.user.doan247android.R;
import com.user.doan247android.adapter.LoaiSpAdapter;
import com.user.doan247android.adapter.SanPhamMoiAdapter;
import com.user.doan247android.model.LoaiSp;
import com.user.doan247android.model.SanPhamMoi;
import com.user.doan247android.model.User;
import com.user.doan247android.retrofit.ApiBanHang;
import com.user.doan247android.retrofit.RetrofitClient;
import com.user.doan247android.utils.Utils;
import com.google.android.material.navigation.NavigationView;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.paperdb.Paper;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {

    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewManHinhChinh;
    NavigationView navigationView;
    ListView listViewMangHinhChinh;
    DrawerLayout drawerLayout;
    LoaiSpAdapter loaiSpAdapter;
    List<LoaiSp> mangloaisp;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    List<SanPhamMoi> mangSpMoi;
    SanPhamMoiAdapter spAdapter;
    NotificationBadge badge;
    FrameLayout frameLayout;
    ImageView imgsearch, imageMess;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        Paper.init(this);
        

        if (Paper.book().read("user") != null){
            User user = Paper.book().read("user");
            Utils.user_current = user;
        }
        getToken();
        AnhXa();
        ActionBar();

        if (isConnected(this)){

            ActionViewFlipper();
            getLoaiSanPham();
            getSpMoi();
            getEvenCick();


        }else{
            Toast.makeText(getApplicationContext(), "Không Có Internet, Vui Lòng Kiểm Tra Kết Nối", Toast.LENGTH_LONG).show();
        }
    }

    private void getToken() {
        FirebaseMessaging.getInstance().getToken()
                .addOnSuccessListener(new OnSuccessListener<String>() {
                    @Override
                    public void onSuccess(String s) {
                        if (!TextUtils.isEmpty(s)){
                            compositeDisposable.add(apiBanHang.updateToken(Utils.user_current.getId(),s)
                                    .subscribeOn(Schedulers.io())
                                    .observeOn(AndroidSchedulers.mainThread())
                                    .subscribe(
                                            messageModel -> {

                                            },
                                            throwable -> {
                                                Log.d("log", throwable.getMessage());
                                            }
                                    ));


                        }
                    }
                });
        compositeDisposable.add(apiBanHang.gettoken(1)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        userModel -> {
                            if (userModel.isSuccess()){
                                Utils.ID_RECEIVED = String.valueOf(userModel.getResult().get(0).getId());
                            }
                        },
                        throwable -> {

                        }
                ));
    }

    private void getEvenCick() {
        listViewMangHinhChinh.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                switch (position){
                    case 0:
                        Intent trangchu = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(trangchu);
                        break;
                    case 1:
                        Intent adidas = new Intent(getApplicationContext(), AdidasActivity.class);
                        adidas.putExtra("loai",2);
                        startActivity(adidas);
                        break;
                    case 2:
                        Intent nike = new Intent(getApplicationContext(), NikeActivity.class);
                        nike.putExtra("loai",3);
                        startActivity(nike);
                        break;
                    case 3:
                        Intent lienhe = new Intent(getApplicationContext(), LienHeActivity.class);
                        startActivity(lienhe);
                        break;
                    case 4:
                        Intent thongtin = new Intent(getApplicationContext(), ThongTinActivity.class);
                        startActivity(thongtin);
                        break;
                    case 5:
                        Intent donhang = new Intent(getApplicationContext(), XemDonActivity.class);
                        startActivity(donhang);
                        break;
//                    case 6:
//                        Intent quanli = new Intent(getApplicationContext(), QuanLiActivity.class);
//                        startActivity(quanli);
//                        break;
                    case 6:
                        //Xóa key user
                        Paper.book().delete("user");
                        Intent dangnhap = new Intent(getApplicationContext(), DangNhapActivity.class);
                        startActivity(dangnhap);
                        FirebaseAuth.getInstance().signOut();
                        finish();
                        break;
                }
            }
        });
    }

    private void getSpMoi() {
        compositeDisposable.add(apiBanHang.getSpMoi()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        sanPhamMoiModel -> {
                            if (sanPhamMoiModel.isSuccess()){
                                mangSpMoi = sanPhamMoiModel.getResult();
                                spAdapter = new SanPhamMoiAdapter(getApplicationContext(), mangSpMoi);
                                recyclerViewManHinhChinh.setAdapter(spAdapter);
                            }
                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), "Không kết nối được với sever"+throwable.getMessage(), Toast.LENGTH_LONG).show();
                        }
                ));

    }

    private void getLoaiSanPham() {
        compositeDisposable.add(apiBanHang.getLoaiSp()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                . subscribe(

                        loaiSpModel -> {
                            if (loaiSpModel.isSuccess()){
                                mangloaisp = loaiSpModel.getResult();
//                                mangloaisp.add(new LoaiSp("Quản lí",""));
                                mangloaisp.add(new LoaiSp("Đăng xuất","data:image/png;base64,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"));
                                //khởi tạo adapter
                                loaiSpAdapter = new LoaiSpAdapter(getApplicationContext(), mangloaisp);
                                listViewMangHinhChinh.setAdapter(loaiSpAdapter);
                            }
                        }
                ));
    }

    private void ActionViewFlipper() {
        List<String> mangquangcao = new ArrayList<>();
        mangquangcao.add("https://static.nike.com/a/images/f_auto/dpr_1.3,cs_srgb/w_1423,c_limit/e375c7be-cd4f-4419-a9df-2ff464ec9552/nike-just-do-it.jpg");
        mangquangcao.add("https://static.nike.com/a/images/f_auto/dpr_1.3,cs_srgb/w_1423,c_limit/711bee91-53d3-47b6-b0f4-bb7fd7978b8a/nike-just-do-it.jpg");
        for (int i = 0; i< mangquangcao.size(); i++){
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(mangquangcao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation slide_in = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_in_right);
        Animation slide_out = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_out_right);
        viewFlipper.setInAnimation(slide_in);
        viewFlipper.setOutAnimation(slide_out);

    }

    private void ActionBar() {

        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });

    }

    private void AnhXa() {
        imgsearch = findViewById(R.id.imgsearch);
        imageMess = findViewById(R.id.image_mess);
        toolbar = findViewById(R.id.toolbarmanghinhchinh);
        viewFlipper = findViewById(R.id.viewflipper);
        recyclerViewManHinhChinh = findViewById(R.id.recycleview);
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this, 2);
        recyclerViewManHinhChinh.setLayoutManager(layoutManager);
        recyclerViewManHinhChinh.setHasFixedSize(true);
        listViewMangHinhChinh = findViewById(R.id.listviewmanghinhchinh);
        navigationView = findViewById(R.id.navigationview);
        drawerLayout = findViewById(R.id.drawerlayout);
        badge = findViewById(R.id.menu_sl);
        frameLayout = findViewById(R.id.framegiohang);
        //khởi tạo list
        mangloaisp = new ArrayList<>();
        mangSpMoi = new ArrayList<>();

        //khởi tạo list
        if (Utils.manggiohang == null){
            Utils.manggiohang = new ArrayList<>();
        }else{
            int totalItem = 0;
            for (int i = 0; i < Utils.manggiohang.size(); i++){
                totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
            }
            badge.setText(String.valueOf(totalItem));
        }
        frameLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent giohang = new Intent(getApplicationContext(), GioHangActivity.class);
                startActivity(giohang);
            }
        });
        imgsearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), SearchActivity.class);
                startActivity(intent);

            }
        });

        imageMess.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), ChatActivity.class);
                startActivity(intent);

            }
        });


    }

    @Override
    protected void onResume() {
        super.onResume();
        int totalItem = 0;
        for (int i = 0; i < Utils.manggiohang.size(); i++){
            totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
        }
        badge.setText(String.valueOf(totalItem));
    }

    private boolean isConnected(Context context){
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        NetworkInfo mobile = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        if ((wifi != null && wifi.isConnected()) || (mobile != null && mobile.isConnected()) ){
            return true;
        }else {
            return false;
        }
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}