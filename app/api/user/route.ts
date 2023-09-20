import prisma from "@/prisma/prisma";
import { NextApiRequest, NextApiResponse } from "next";
import { NextResponse } from "next/server";

export async function GET(req: NextApiRequest, res: NextApiResponse) {
  try {
    const user = await prisma.user.findUnique({
      where: {id: 1}
    })
    return NextResponse.json(user)
  } catch {
    return new NextResponse("Error")
  }
}

export async function POST() {

}