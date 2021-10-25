<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;
use App\Models\ProdukDetail;

class produkController extends Controller
{
    public function indexList(){
		return view('produk');
	}
	public function indexCreate(){
		
		return view('create');
		
	}
	public function indexCreateDetail(){
		
		return view('createDetail');
		
	}
	public function listProduk(){
		$produk = Produk::join('produk_detail', 'produk_detail.id_produk', '=', 'produk.id')
				->select('produk.id','produk_detail.id as idProduk', 'produk.nama', 'produk.kategori','produk.deskripsi')
				->get();
		return $produk;
	}
	public function listProdukDetail(){
		$key 	= $_GET['key'];
		$produk = ProdukDetail::where('produk_detail.id_produk', $key)
				->get();
		return $produk;
	}
	public function listProdukByKeyword(){
		$search = $_GET['key'];
		$produk = Produk::join('produk_detail', 'produk_detail.id_produk', '=', 'produk.id')
				->select('produk.id','produk_detail.id as idProduk', 'produk.nama', 'produk.kategori','produk.deskripsi')
				->where('produk.nama','like', "%$search%")
				->orWhere('produk.kategori', 'like', "%$search%")
				->orWhere('produk.deskripsi', 'like', "%$search%")
				->orWhere('produk_detail.warna', 'like', "%$search%")
				->orWhere('produk_detail.ukuran', 'like', "%$search%")
				->orWhere('produk_detail.harga', 'like', "%$search%")
				->get();
		return $produk;
	}
	public function listProdukByKategori(){
		$search = $_GET['key'];
		$produk = Produk::join('produk_detail', 'produk_detail.id_produk', '=', 'produk.id')
				->select('produk.id','produk_detail.id as idProduk', 'produk.nama', 'produk.kategori','produk.deskripsi')
				->where('produk.kategori','like', "%$search%")
				->get();
		return $produk;
	}
	public function storeProduk(){
		$nama 						= $_GET['nama'];
		$kategori 					= $_GET['kategori'];
		$deskripsi 					= $_GET['deskripsi'];
		$warna 						= $_GET['warna'];
		$ukuran 					= $_GET['ukuran'];
		$harga 						= $_GET['harga'];
			
		$produk 					= new Produk;
        $produk->nama 				= $nama;
        $produk->kategori 			= $kategori;
        $produk->deskripsi 			= $deskripsi;
		$produk->save();

		$produkDetail 				= new ProdukDetail;
        $produkDetail->warna 		= $warna;
        $produkDetail->id_produk 	= $produk->id;
        $produkDetail->ukuran 		= $ukuran;
        $produkDetail->harga 		= $harga;
		$produkDetail->save();
		
        
	}
	public function DeleteProduk(){
		$key = $_GET['key'];
		Produk::where('id', $key)->delete();
	}
}
