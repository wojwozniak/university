import { Outlet } from "react-router-dom";
import Navbar from "./Navbar";

export default function RootLayout() {
  return (
    <div className="flex flex-col min-h-screen w-screen bg-background">
      <Navbar />
      <main className="p-4 h-full w-full">
        <Outlet />
      </main>
    </div>
  );
}