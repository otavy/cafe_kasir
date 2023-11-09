import React from 'react'
import { useNavigate } from "react-router-dom";
import logo from "./OIP.jpeg"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";   
import { faHome, faTable, faUser, faBarChart, faUtensils, faList } from "@fortawesome/free-solid-svg-icons";
export default function Sidebar() {
    const navigate = useNavigate()
    const handleLogout = () => {
        sessionStorage.clear()
        navigate('/')
        window.location.reload()
    }

    return (

        <aside
            class="sidebar w-64 md:shadow transform -translate-x-full md:translate-x-0 transition-transform duration-150 ease-in bg-white"
        >
            <div class="sidebar-header flex items-center justify-center py-4">
                <div class="inline-flex">
                    <a href="#" class="inline-flex flex-row items-center">
                        <img src={logo} class="w-20 h-20 text-red-400" fill="currentColor" viewBox="0 0 20 20" />
                        <span class="leading-10 text-brown-600 text-2xl font-bold ml-1 uppercase">Cafe</span>
                    </a>
                </div>
            </div>
            <div class="sidebar-content px-4 py-6">
                <ul class="flex flex-col w-full">
                    <li class="my-px">
                        <a
                            href="/data_transaksi"
                            class="flex flex-row items-center h-10 px-3 rounded-lg text-blue-600 hover:bg-blue-100 hover:text-blue-800 font-base"
                        >
                            <span class="mr-2 flex items-center justify-center text-lg text-gray-400">
                                <FontAwesomeIcon icon={faList} color="blue" />
                            </span>
                            <span class="ml-3">Data transaksi</span>
                        </a>
                    </li>
                    <li class="my-px">
                        <a
                            href="/statistik_manager"
                            class="flex flex-row items-center h-10 px-3 rounded-lg text-blue-600 hover:bg-blue-100 hover:text-blue-800 font-base"
                        >
                            <span class="mr-3 flex items-center justify-center text-lg text-gray-400">
                                <FontAwesomeIcon icon={faBarChart} color="blue" />
                            </span>
                            <span class="ml-3">Statistik</span>
                        </a>
                    </li>

                    <li class="my-px" onClick={handleLogout}>
                        <a
                            href="/"
                            class="flex flex-row items-center h-10 px-3 rounded-lg text-blue-600 hover:bg-blue-100 hover:text-blue-800 mt-32"
                        >
                            <span class="mr-3 flex items-center justify-center text-lg text-red-400">
                                <svg
                                    fill="none"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                    class="h-6 w-6"
                                >
                                    <path
                                        d="M8 11V7a4 4 0 118 0m-4 8v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2z"
                                        />
                                </svg>
                            </span>
                            <span class="ml-2" onClick={() => this.logOut()}>Logout</span>
                        </a>
                    </li>
                </ul>

            </div>
        </aside>

    )
}