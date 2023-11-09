import React from "react";
import { Outlet } from "react-router-dom"
import Sidebar from "./SidebarManager";
import Header from "./Header";
import "./admin.css";

export default function Layout() {
    return (
        <div class="adminbg">
            <Sidebar />
            <div className="flex-1">
                <Header />
                <div> <Outlet /> </div>
            </div>
        </div>
    )
}