"use client";
import { getUserData } from "@/prisma/helpers/getUserData";
import { useEffect, useState } from "react";

export default function Home() {
  const [user, setUser] = useState();
  useEffect(() => {
    const initialize = async () => {
      let userData = await getUserData();
      setUser(userData.name);
    }
    initialize()
  }, [user])
  return <div>Hello {user}</div>;
}
