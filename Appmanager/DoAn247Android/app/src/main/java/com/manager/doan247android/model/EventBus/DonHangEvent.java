package com.manager.doan247android.model.EventBus;

import com.manager.doan247android.model.DonHang;

public class DonHangEvent {
    DonHang donHang;

    public DonHangEvent(DonHang donHang) {
        this.donHang = donHang;
    }

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }
}
