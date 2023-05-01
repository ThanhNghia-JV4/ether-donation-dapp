pragma solidity ^0.8.0;

contract Donation{
    address owner; //dia chi chu so huu, chi luu tru dia chi ban dau khi trien khai hop dong 
    uint256 totalDonation; //tong so tien Donation

    struct Donation{ // luu tru thong tin nguoi donation
        address donor; //dia chi nguoi quyen gop
        uint256 amount; //so tien donation
    }    

    Donation donation;
    Donation[] donations; //tao 1 mang Donation

    constructor(){ //duoc trien khai 1 lan 
        owner = msg.sender; //dia chi chi cua nguoi tien khai hop dong ban ddau
    }

    receive() external payable { //chuc nang nhan ether

        donation = Donation(
            msg.sender, //lay dia chi nguoi gui
            msg.value //so ether gui 
        );

        donations.push(donation); //them vao Donatinon
        totalDonation += msg.value; // cong so tien mn Donatinon
    }

    function getDonations() external view returns(Donation[] memory){ //ham nay tra ve mang chu tung nguoi Donation da dc thuc hien
        return donations; //tra ve Donation da hoan tat
    }

    function getTotalDonations() external view returns(uint256) { //so tien da Donation
        return totalDonation; //tong so tien Donation da duoc thuc hien
    }

}
