const transaksiModel = require(`../models/index`).transaksi;
const detailsOfTransaksiModel = require('../models/index').detail_transaksi;
const userModel = require(`../models/index`).user;
const mejaModel = require(`../models/index`).meja;
const Op = require(`sequelize`).Op;
const { path } = require(`../models/transaksi`);
const fs = require(`fs`);
const md5 = require(`md5`);
const mysql = require(`mysql2`);
const { use } = require('../routes/user.route');

exports.getAllTransaksi = async (request, response) => {
  transaksiModel.findAll({
    include: [{
      model: mejaModel,
      required: true, // Use "required: true" for inner join, or "required: false" for left join
    },{
      model: userModel,
      required: true
    }
  ],
  })
    .then(result => {
        response.json({
            data: result
        })
    })
    .catch(error => {
        response.json({
            message: error.message
        })
    })
};

exports.findTransaksi = async (request, response) => {
  let keyword = request.body.keyword;

  let transaksi = await transaksiModel.findAll({
    where: {
      [Op.or]: [
        { tgl_transaksi: { [Op.substring]: keyword } },
        { id_user: { [Op.substring]: keyword } },
        { id_meja: { [Op.substring]: keyword } },
        { nama_pelanggan: { [Op.substring]: keyword } },
        { alamat: { [Op.substring]: keyword } },
        { status: { [Op.substring]: keyword } },
      ],
    },
  });
  return response.json({
    success: true,
    data: transaksi,
    message: `All transaksi have been loaded`,
  });
};

exports.addTransaksi = async (request, response) => {
  let { tgl_transaksi, id_user, id_meja, nama_pelanggan, status } = request.body;

  let check = await transaksiModel.findOne({
    where: {
      id_meja: id_meja,
      tgl_transaksi: tgl_transaksi
    }
  });

  // if (check !== null) {
  //   return response.json({
  //     message: "Meja sudah dipesan pada tanggal tersebut"
  //   });
  // }

  let data = {
    tgl_transaksi: request.body.tgl_transaksi,
    id_user: request.body.id_user,
    id_meja: request.body.id_meja,
    nama_pelanggan: request.body.nama_pelanggan,
    alamat: request.body.alamat,
    total: request.body.total,
    status: request.body.status
  };

  transaksiModel.create(data)
  .then(result => {
    // Simpan data detail transaksi
    let detailData = {
      id_transaksi: result.id, // ID transaksi yang baru dibuat
      id_menu: request.body.id_menu,
      qty:request.body.totalQty,
      harga: request.body.totalPrice
      // tambahkan properti detail transaksi lainnya
    };

    detailsOfTransaksiModel.create(detailData)
      .then(detailResult => {
        response.json({
          message: "Data Berhasil Ditambahkan",
          data: {
            transaksi: result,
            detailTransaksi: detailResult
          }
        });
      })
      .catch(error => {
        response.json({
          message: error.message
        });
      });
  })
  .catch(error => {
    response.json({
      message: error.message
    });
  });

};

exports.updateTransaksi = (request, response) => {
  let data = {
    tgl_transaksi: request.body.tgl_transaksi,
    id_user: request.body.id_user,
    id_meja: request.body.id_meja,
    nama_pelanggan: request.body.nama_pelanggan,
    alamat: request.body.alamat,
    status: request.body.status

  }

    let id_transaksi = request.params.id;


    transaksiModel.update(data, { where: { id: id_transaksi } })
    .then(result => {
        response.json ({
            success: true,
            message: "Data Berhasil Diganti",
        })
    })
    .catch(error => {
        response.json({
            message: error.message
        })
    })
};


exports.deleteTransaksi = (request, response) => {
  let id_transaksi = request.params.id

  transaksiModel.destroy({ where: { id_transaksi: id_transaksi } })
    .then((result) => {
      return response.json({
        success: true,
        message: `Data transaksi has been deleted`,
      });
    })
    .catch((error) => {
      return response.json({
        success: false,
        message: error.message,
      });
    });
};



// const transaksiModel = require(`../models/index`).transaksi;
// const detailsOfTransaksiModel = require('../models/index').detail_transaksi;
// const userModel = require(`../models/index`).user;
// const mejaModel = require(`../models/index`).meja;
// const menuModel = require(`../models/index`).menu;
// const detail_transaksi = require('../models/detail_transaksi');
// const Op = require(`sequelize`).Op;
// const { path } = require(`../models/transaksi`);
// const fs = require(`fs`);
// const md5 = require(`md5`);
// const mysql = require(`mysql2`);
// const { use, response } = require('../routes/user.route');
// const { request } = require('http');

// exports.getAllTransaksi = async (request, response) => {
//   transaksiModel.findAll({
//     include: [{
//       model: mejaModel,
//       required: true, // Use "required: true" for inner join, or "required: false" for left join
//     },{
//       model: userModel,
//       required: true
//     }
//   ],
//   })
//     .then(result => {
//         response.json({
//             data: result
//         })
//     })
//     .catch(error => {
//         response.json({
//             message: error.message
//         })
//     })
// };

// exports.findTransaksi = async (request, response) => {
//   let keyword = request.body.keyword;
//   // let startDate = request.body.startDate; // Tanggal awal
//   // let endDate = request.body.endDate;     // Tanggal akhir

//   let transaksi = await transaksiModel.findAll({
//     where: {
//       [Op.or]: [
//         { tgl_transaksi: { [Op.substring]: keyword } },
//         { id_user: { [Op.substring]: keyword } },
//         { id_meja: { [Op.substring]: keyword } },
//         { nama_pelanggan: { [Op.substring]: keyword } },
//         { alamat: { [Op.substring]: keyword } },
//         { status: { [Op.substring]: keyword } },
//       ],
//     },
//   });
//   return response.json({
//     success: true,
//     data: transaksi,
//     message: `All transaksi have been loaded`,
//   });
// };


// exports.addTransaksi = async (request, response) => {
//   let { tgl_transaksi, id_meja } = request.body;
//   console.log(request.body);

//   try {
//     let check = await transaksiModel.findOne({
//       where: {
//         id_meja: id_meja,
//         tgl_transaksi: tgl_transaksi,
//       },
//     });

//     if (check !== null) {
//       return response.json({
//         message: "Meja sudah dipesan pada tanggal tersebut",
//       });
//     }

//     let data = {
//       tgl_transaksi: request.body.tgl_transaksi,
//       id_user: request.body.id_user,
//       id_meja: request.body.id_meja,
//       nama_pelanggan: request.body.nama_pelanggan,
//       alamat: request.body.alamat,
//       total: request.body.total,
//       status: request.body.status,
//     };

//     let result = await transaksiModel.create(data);

//     // Prepare an array to store details data
//     let detailsData = request.body.detail_transaksi.map((detail) => {
//       return {
//         id_transaksi: result.id,
//         id_menu: detail.id_menu,
//         qty: detail.qty,
//         harga: detail.subtotal,
//       };
//     });

//     // Bulk create the details data
//     let detailResults = await detailsOfTransaksiModel.bulkCreate(detailsData);

//     response.json({
//       message: "Data Berhasil Ditambahkan",
//       data: {
//         transaksi: result,
//         detailTransaksi: detailResults,
//       },
//     });
//   } catch (error) {
//     response.json({
//       message: error.message,
//     });
//   }
// };


// exports.updateTransaksi = (request, response) => {
//   let data = {
//     tgl_transaksi: request.body.tgl_transaksi,
//     id_user: request.body.id_user,
//     id_meja: request.body.id_meja,
//     nama_pelanggan: request.body.nama_pelanggan,
//     alamat: request.body.alamat,
//     status: request.body.status

//   }

//     let id_transaksi = request.params.id;


//     transaksiModel.update(data, { where: { id: id_transaksi } })
//     .then(result => {
//         response.json ({
//             success: true,
//             message: "Data Berhasil Diganti",
//         })
//     })
//     .catch(error => {
//         response.json({
//             message: error.message
//         })
//     })
// };


// exports.deleteTransaksi = (request, response) => {
//   let id_transaksi = request.params.id;

//   transaksiModel
//     .destroy({ where: { id: id_transaksi } })
//     .then((result) => {
//       return response.json({
//         success: true,
//         message: `Data transaksi has been deleted`,
//       });
//     })
//     .catch((error) => {
//       return response.json({
//         success: false,
//         message: error.message,
//       });
//     });
// };