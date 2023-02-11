package com.user.doan247android.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.user.doan247android.R;
import com.user.doan247android.model.DonHang;

import java.util.List;

public class DonHangAdapter extends RecyclerView.Adapter<DonHangAdapter.MyViewHolder> {
    private RecyclerView.RecycledViewPool viewPool = new RecyclerView.RecycledViewPool();
    Context context;
    List<DonHang> listdonhang;

    public DonHangAdapter(Context context, List<DonHang> listdonhang) {
        this.context = context;
        this.listdonhang = listdonhang;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_donhang, parent, false);

        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        DonHang donHang = listdonhang.get(position);
        holder.txtdonhang.setText("Đơn hàng: " + donHang.getId());
        holder.trangthai.setText(trangThaiDon(donHang.getTrangthai()));

        LinearLayoutManager layoutManager = new LinearLayoutManager(
          holder.reChitiet.getContext(),
          LinearLayoutManager.VERTICAL,
                false
        );
        layoutManager.setInitialPrefetchItemCount(donHang.getItem().size());
        //Adapter chi tiet
        ChitietAdapter chitietAdapter = new ChitietAdapter(context, donHang.getItem());
        holder.reChitiet.setLayoutManager(layoutManager);
        holder.reChitiet.setAdapter(chitietAdapter);
        holder.reChitiet.setRecycledViewPool(viewPool);
    }
    private String trangThaiDon(int status){
        String result = "";
        switch (status){
            case 0:
                result = "Đơn Hàng Đang Được Xử Lí...";
                break;
            case 1:
                result = "Đơn Hàng Đã Được Thông Qua";
                break;
            case 2:
                result = "Đơn Hàng Đã Giao Gho Đơn Vị Vận Chuyển";
                break;
            case 3:
                result = "Giao Hàng Thành Công Thành Công";
                break;
            case 4:
                result = "Đơn Hàng Đã Hủy";
                break;
        }
        return result;
    }

    @Override
    public int getItemCount() {
        return listdonhang.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView txtdonhang, trangthai;
        RecyclerView reChitiet;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            txtdonhang = itemView.findViewById(R.id.iddonhang);
            trangthai = itemView.findViewById(R.id.tinhtrang);
            reChitiet = itemView.findViewById(R.id.recycleview_chitiet);
        }
    }
}
