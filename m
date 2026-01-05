Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07E2749DC
	for <timestamp@lists.linux.dev>; Mon,  5 Jan 2026 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767652486; cv=fail; b=bFD1M+vwVMN7bS+MiIsd+2MHZL9rFS/6NjIOr/+R+UgiE3syzTrySYnoIN0Jk8UFxp2m9BPPmhxajfLEwHuBaAnK8ElrkHx3Mp+UZI8bRRjK6Mjw9B+sHuJ/M/t/gdfI041OzVr+Uv+l4ERx+Es7E7betBZYWg+4fKAtlyfUzWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767652486; c=relaxed/simple;
	bh=2L+dorXSTlnI7PZsOivaxfmgGz/eyo2EzyKumnwBFyk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BOalZ97QEC6P3BcE7RZPiJdKxSQcm11OjOi0Rhrh6j+ICmkrfLxYpNRewHURcg6uFSGtEI+pxDUgkH1/JdEgIHkRJmZ7UmTpBUeSjTmTqj449FitwWuFl8qu72P1rSvKXB1+dhwW6YUmZRqSzThqPAyXglVTz+lBEgWr/zzsVdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TSpco3+6; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TSpco3+6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhQV0EWr2h/fafuNW+rhOiTcm112WbONeeY7k/gP70AZsNfO4nhnzzEh4YY+vwxZEqSVbGPHrzLejXzjlDauLpGBxLrTdPmixAXdrwRtHtg23z5bx39CXhl29gyFrxAtews8GwBbkqEwwwxBxegjuEAgZZswfEfJkQdq8OOItSzpIKu9t5bNKP7g1pYwJ4qrHKIOBW0zyJGkKBp7qJ3X856TWHW/iEsJZi8MO2hzdSaVVBVXm8TU36roT+TJPrf1qFa3tvPFxpcRdfJjWhMIHWYv4GoppdJPcssEZh7aYLzP4lginszP+hbBaKwGBOCAZS9b15iWefhnMFaqk3SzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKtH1h6BQHOk65YJjO1vswgBgZtjP92ST/E+JZxW/H4=;
 b=gUcsEf5XEWPPiHG7Y1ClWWGtmM+73ktB7kPINEu/NeSMJP3J7r4W5VpyQzfFzwBIixUo3qdWGJdjochgEz1OgABD3OZUUD5qhiNd/znjTv8Ps+9tR/tnJN+/oTe7YxOlepQBiGK6auxiVsnUUhN6sZO5FILyBum/G1glYASClzEMgpM7TGTHTZRbJnLs+JecxhM3ZG5YuUhEJ2aaW8W7RlN3K3GFFAIAIXdmkfNrE9PIzNkZBq/ynrtQHXyTibNCx0aCdl4bnikPd4xWLAt2xkXpATkgWWwr+rDuMaARsqQ2oKUrb2LpwZkaJ07ofWhi4CbokIrnF4hVV6jwrHXQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKtH1h6BQHOk65YJjO1vswgBgZtjP92ST/E+JZxW/H4=;
 b=TSpco3+6G+Y60200Txx230DKLciigq/Oiso3AXP19mLwEE2zeUgtGTDsh/ObQOI1/62WszSW/gmvs6zMZg3aJ3E4JTp6gAy2uTXWdNRS4i99rgMSwCZ/euJrRwy5+6lQ9R0OhcsTmEVud2r+1sEu4aoH9nAayOvKg9hKfgZQ7AcyAKxbzJnVMDj7jlOEPlaBNPNU8NpEbpUGXugMgE7+MYHw7B79QI2KKTIwdhGFiZHiJrX87Ku7oNKN2Xco8auMLtFvwIuGtlLWUcKnq1v51khZzkn1MYEoPEmUVvQ7D1/POuXglAkcrl/7KcG9j6Y/StGOIn0LZsNzon4QnTVBmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:34:41 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 22:34:41 +0000
Message-ID: <6defe6e1-873e-44cb-91ba-b30debc33afa@nvidia.com>
Date: Mon, 5 Jan 2026 14:34:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hte: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, timestamp@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>
References: <20251224143234.47424-1-marco.crivellari@suse.com>
Content-Language: en-US
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20251224143234.47424-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: c93cb706-fc2b-4d6a-fec1-08de4caa9dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHpjdksxa1VIMHR0WlVyTC8zR0hNK2dlaTJvMXdmWndWc3JZUGgyYTlEQzZ4?=
 =?utf-8?B?eGtLbWoxYUhKR3FHbG50ODFtWUREcEJCeVRWNldnS2lYODlvRU1PUmNWc0dQ?=
 =?utf-8?B?OTBLbkdlbWVMM3dmRUc2RDdaTjgvbjZ5OFZGYUxFbVFOK2xscXppSGs4dFJy?=
 =?utf-8?B?YjYzdFJXMjR6aSthTmtJSTJHZGxCQVpyNGZQYmpvZ0I2dU9penFJdHBCZlBJ?=
 =?utf-8?B?SVNoN0hBRVZnVXl3YnZCU3VFcktIRlhKL0dRUHBqbC8vd2cxMVJaZ1l3ZVFQ?=
 =?utf-8?B?alBUS0t1MTkyVlBhRzBQZFp1WURxV0lNcGl2S05SdVZ2SDZRR1hSVmZSSklD?=
 =?utf-8?B?emt5Rmc1elNVbnpjNmV3YUpqV3dpUjJvc2Jodk5XSlNST1hEdHdFdk1DTmdO?=
 =?utf-8?B?UnNZd3V1d1EyTm5hRFJ4Vm95WmpZOEM1dGpXSzNDbTY4WFJKeXQ3NzFQaUVz?=
 =?utf-8?B?NmdxODEwL2hoM1pIVEFUSUZUNkxNYnBCbEtrS0puSFVic25OdG4rcndma01C?=
 =?utf-8?B?amtWVjdUUDdIRzR1eTVmbWNNUmJjdWEvQWVWUlpZRURwekZ6STRHTEY2U2FY?=
 =?utf-8?B?bGV2VGRNbHlqMUNHN1RaOG1oOFBlTHFaRXBjOEcwWklRanFPc1ZVeGJiSHJz?=
 =?utf-8?B?MGs0aE1LMFd1a1NPaTJTWTZyVlc4cHNLd1lLMWxTMlVwTTN4Y1U0dGJXK1JN?=
 =?utf-8?B?TWsxM2EycnlWWjJvMjY1MHhIWE1WL3JQS1pIdU03L2RTcng0UVZZRUltdElN?=
 =?utf-8?B?RC8rWEJxaG5JcUJWcWQyYUNpQkNsTElLb0Y5akV0MVk0WjlKQXZzWFBBS3Jj?=
 =?utf-8?B?YkRoeEVMYTVyZ1Y5RmduaklRUDEzakY2TDdOa1Fib3BmOVVCVmFsK2g4UnVm?=
 =?utf-8?B?b2pPa1Rhc2RnTnlCODdYaVNpSEs0blNpeEFSa0tpcmNPMVpUaHp4Q2tOdVZL?=
 =?utf-8?B?K25VdThDQnJEOW1RMGFwbi9NQzhTYURrWXhQa2FRZUt1ZUlvOXg4MlZQR2VZ?=
 =?utf-8?B?M3JKYlhJa2d2NWtPOTFyeDE0TlZqMzNpZkxlMFdEOXByM1kxRTk1LzlXWmdh?=
 =?utf-8?B?SUlSak91MFNLTFhkMzh6TUc3TmloWEw3em9GS2kydU0xTXlZRlZzbFBtQm1S?=
 =?utf-8?B?b3YzMmoyVUlxRGdoRnoyMnA0d09JSGltSUpQaDJITUt5dDJrOXVqZE5uc2t2?=
 =?utf-8?B?U0N6bWNaSldDbkQyczh3eGVra1FnSHJRc2dpNkovbzlycUdGYlpmS3I3MHFo?=
 =?utf-8?B?VitrVUQ2NU41TmZzc2RCc1Z5Z3kvcG94ejJBdXo5a0hncG1xUEJXbklveHRV?=
 =?utf-8?B?MHZRR01QYzFBZkZaclg2SEc1M3NPK0NXemtFM0J6K3FzZERZdkY4NG1henox?=
 =?utf-8?B?RGFBL1doRFU1cmYxZklRaFlqeDF6VEVWR2Z3cCsxK1dmR29jbzJGNkt2bk44?=
 =?utf-8?B?N05iY1lLU0pVWFQ3TkpjWHQ2NW9vbzhwTElpakE4REdiRjJDREU0UVZxNFYr?=
 =?utf-8?B?QS9DM3JHWXh4WU9sZHJNRjV6TkhmRFZRRFRnQVJMSDhMd09VTWlDWG5FWDRv?=
 =?utf-8?B?REE5ckRsZ3pjYmNQUWRpMUtUVVFlSVhFeERqZVo5MmlaVjV4NmltYkdUK1gw?=
 =?utf-8?B?WGVqVkFwdzFSbndlY0JlS0FOV0l3aFphTFRscys4MHpGQ1VBTDYrellkS1pM?=
 =?utf-8?B?VStkaUhxWDltbEhpbS9pTUc4T3VEak9FN3dsT3VNeWxzQXRGcmVPdU04ZHlq?=
 =?utf-8?B?cXgzTjhNcU1uTXJ1cDFlTG9veUZHNnNzd0VMbHlNNnEvZGlvdXhVanJCUlRG?=
 =?utf-8?B?eWU1ckN4bHdtdjFVcWVrYlFmZmUvcHdCSHVQcjFTWU40U1B0OGs2dXpUMUtv?=
 =?utf-8?B?ZDI5b3UvT1ZPTTMraStqUmtYeHY2MzFsTjFCVmgrM3AvSEtQNWNyaEU0cEwz?=
 =?utf-8?Q?PhUbN0TFzZMyVeOm9/Rsq4k6t2T6n1dm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NiV09GVmowYWlOSm5ocmExYUxzTDVGL3c4QTRBVWtLNjQxd1N2V1dRbWpv?=
 =?utf-8?B?UWlvWndoeEhOS1NORDBWdzk0TktUTXNYTlNlTHJNZ2ZNQWVKbzVKek1HbE9V?=
 =?utf-8?B?M0ZDL1JvRnUyanRhRUkwZWtxM00wRnZxVVhQTHVZM2hROTV3Rm9HTjZyTlpm?=
 =?utf-8?B?b1EvUDFRak5IVEhVUW1IbkJXRE9HSGx5NHh3YVZSUWZSVkYyQUlDSUluaVNM?=
 =?utf-8?B?cUhwZTA4VW9BUktkdytDUXZrTUlZWTYvWmc5d2hSM2JIbDM5TGk2cUxJRDM0?=
 =?utf-8?B?WU1CcDRMWHBGcmJrODdqMGpVbHRJQlVTNllMVEh0cUZKRmR3UGZQdkh2VVAv?=
 =?utf-8?B?UUFucjN2L2liNVJmV1VSSzdFazRMT3NlZnpYL3RMa0dSV2ZqMnNwNEQ4bTAy?=
 =?utf-8?B?TkZPZjIwb1VCSzRDNXRKT0FYUDlhTks0RE40Q1IxSzZXamY4WmVsemp3Ryt1?=
 =?utf-8?B?Vmp1TlhnazhGWnFhMkcwNi9JSlViclVnOThKVFlWT0xMVmIrTDJtc0xOUjdW?=
 =?utf-8?B?VFVCRE51T3ZXL1F6RE9NSXI3bTExTzh1alRSUVR1bXhYNjNrdk15YzcwVnpP?=
 =?utf-8?B?d2xGR29idVo2N3M0YzhFMy85M0FKNW5qSFZwbXJtNjZxbVJJaWMzUTNFRnlI?=
 =?utf-8?B?V0pWNEJVdm5DNVpkT3FHVEUwUCtFYjBXOFNGNloxSThoOE9iNW9JdVRSRmk3?=
 =?utf-8?B?bmV5RzZHK2hhNytIYkwzNlhNRW9UZjdvSFppQlE4eXJpeTZ2d0JKQzBVbUNy?=
 =?utf-8?B?R25Fb2JlR3FyQzdzMWFJK3hNMHlBRDR2aWFLSHhZeTNyNHBaZ2F2eVlMQlhE?=
 =?utf-8?B?QzVsa3M2aVBPekVmQ2xBeVBoVTRJYVdHSGhyTGVFTE1KN2VUWGMxMDRRUFMv?=
 =?utf-8?B?NUxmeTY4cHFPK2xja1VlSHp1Z2QxckpCYXBpRHB3WUdDelB1cjFzOGw4UHVY?=
 =?utf-8?B?UUlQcTJBa3VGTklJZmJRdkkzbFU0Smg1RzdJaHVZS2tpK2lKY3duanNmNkZW?=
 =?utf-8?B?cUVUbWNnZDYwTU5maWJKN0J1WEhNeHdzaUpBdENoRWFKbk9JYzhyWTE5eUtG?=
 =?utf-8?B?RXY5N3FzK3RpdWgvNGNDUStyVlRIbXhOV3k5ODlVSERWcGQ4cXFhaFNONTZa?=
 =?utf-8?B?d0RXUk1JRnVGdzdsazgwM0l2WVM0WmJSRElDRkZYU3ZVekRHYm5kM0xGVCt4?=
 =?utf-8?B?L2g0ZUhTb2FzWUhURDM4K3FJVFVwMU5QekRpN3N4MUl0QVZTYi94SStSak82?=
 =?utf-8?B?Tmx0QjlQemxTdVdKU1pIeDF5OG91emZJNWxoZ2dXZlBBNjlwMHFBZnYxdC80?=
 =?utf-8?B?WS9acW83MUc2TkJzN0YzZHJ3Uy9XaVpaOERJMzh3QUpUNERyeGNNUzAwb2Vh?=
 =?utf-8?B?eEV6bUxwQUF3bzkxUC8xVGo4RlozVzBrWGpPWEtIbUp6Qk11cDBicG9mUWN2?=
 =?utf-8?B?WHowb21tQ1VoS3haWXkycVd4ODRMWDFRZUxjbENodlpwOVJrSWpWK3lBcmk0?=
 =?utf-8?B?S0hkY1o4anpHd3VhU2k3ZFF2Z21LK1RVaktHNEJYeWQrTzk2UTJXN2NsMzB1?=
 =?utf-8?B?SGpONFZVZzBGNFBMRlMzNzZLRDAwMWdnOUdETk0xaG5BTngzNkRFOXFIcTlI?=
 =?utf-8?B?UklvYXpQVjZvYWdLMWxuUjh5MEw0WElubDFTc1VSNE1ZNXErN0w2aS82S1Ey?=
 =?utf-8?B?VXFRUVVxR2srWXZOMlc1endaVENGYXN1ZDJGZVFkNUtZV0Y3ZVVnekdSeUV5?=
 =?utf-8?B?R1RTRWZ6YnA0emZTTDlQcjBYM3VLczZtckE0d0FESUJKTyt6SEM1akxqSnFo?=
 =?utf-8?B?QzZEeUV2QkptZ1VJOXB4WXowNkpHTlV2MjBYaXlYN1UyaE5hQUk4cE45c2I0?=
 =?utf-8?B?MGxSM2JmSDkwL1BMZjN1d3B4ZjJtK1dCZ0FJQktiWWw3VzJacitvQk5OUzVo?=
 =?utf-8?B?WndDUUJyVGVUSVlVSGtvSitZRmNjYnR6OVZON0RJMjEvOEZqK3RKam5LTFY0?=
 =?utf-8?B?ZnJZOU5XZjBic3FScjJ4WjVJcml0VEhFR1hTdG1IMWZhTFo0OUE1b1hRS05H?=
 =?utf-8?B?QU5ZdnZXaWNTV1VZSUtHWlhscDZ6RFlZaEtlbG1UV1F0dk5rTThxaGpLK3Bq?=
 =?utf-8?B?MzQ3ZnNjTTFTNlJZbER3T1RqcHZ4TXRyejg1aFNSd3R5YW1OOXU3M3VqWE5G?=
 =?utf-8?B?eUZ6Uk0yMnFhbVZrYkk4SVlQNnRaUlZjeTNMTjEvQURrQXJpTlhBZzA4VWdK?=
 =?utf-8?B?QWtGMXVkdHNMUnNkYmJEUWxYSlphRGs5V2dvckdjdWUxaE1NNThhNENwSndW?=
 =?utf-8?B?QU5UcllLeU5QZHN1ZnR3b2xRMXBlUDRMdTlTcjdrTXE5MEt2QU1QUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93cb706-fc2b-4d6a-fec1-08de4caa9dd7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:34:41.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAKbhyjrA4sOyrua+rVSNyMPhrsrpczSc0M+tnPl5o0QmB2/kfTO37hT54NWznuIsimQH8Ilss/bH+UXW9szKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608

On 12/24/25 6:32 AM, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen after a careful review and conversion of each individual
> case, workqueue users must be converted to the better named new workqueues with
> no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> Changes in v2:
> - improved commit message
> - rebased on v6.19-rc2
> ---
>  drivers/hte/hte.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
> index 23a6eeb8c506..e2804636f2bd 100644
> --- a/drivers/hte/hte.c
> +++ b/drivers/hte/hte.c
> @@ -826,7 +826,7 @@ int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
>  
>  	ret = ei->cb(data, ei->cl_data);
>  	if (ret == HTE_RUN_SECOND_CB && ei->tcb) {
> -		queue_work(system_unbound_wq, &ei->cb_work);
> +		queue_work(system_dfl_wq, &ei->cb_work);
>  		set_bit(HTE_TS_QUEUE_WK, &ei->flags);
>  	}
>  
Hi Marco,

Do you want me to pull it in my tree? FYI..I can do it for the next release
cycle i.e. 6.21 timeframe if you want this to be sent through timestamp.

Best Regards,
Dipen Patel
