Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B5B4C97
	for <timestamp@lists.linux.dev>; Mon,  5 Jan 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767652225; cv=fail; b=jwLBy32WfaONW76iVxaOPlY+v+5pdzQnKQ7EXwxwSrWMK85Q48Co6xvSMX3/O9r+j7ef3z79H2oOjMTAbJdxhiDu7+zhrLU5ngzxYXOkAWwOo6+R1KVtv1FNIrepO5x6AVMkKHq/Lw43JEmDLzU5j/fldhCHRZ0cZy2wMLFq2DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767652225; c=relaxed/simple;
	bh=25Xk6zoOgNORVwaaEgR9efsMij+AbmV5ccdtcLCH2jU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nxmG5Qf999McwC1HVZjwLVIGgtKybpwI3Vl9XkA1bkDzqqkUtfzHONrS++CGTXfltvMVQ6bZf0I6RCUHWCr4hoWB1nbCkIXkwoPe6BVRz2uhnz95Ireu5LnkrCS3MqXbuGhB6drkCf8jIbmaupIYzuV2DCi08geB2Ml4It+VkqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rEWDge8H; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rEWDge8H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOGgQUoL2Mm4062610jcsC5qS81qhkPfs+uuiHIF1xhGf7+0dPyQQwdUG9U4klbkaIijl5VlLZr1OUvkG+EW3XfYlgkVjXg+VpU3Ya03n/2XLlQpB/2Mh0VPLrkpsh33MFuHxEnrvigD25g0NyuUyL3O0FKHAxZNtzi58Av1OPC0rwsTI5v5m47f3KfUjkp48k3sy2wADlYoq4RZ6zwoUWA24yJ9zhq7AO6jmBc8pOw+bI0oCXQrG7JzfsF5FMiupxDoi5k1GGvV7avegjXhounK3zHCWGcKpxZx0Lao5J3Dw7FFy3QrjmGLGS886ICOWa2cPdmFAQXqWvyK6BjbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt9N0nClg2Wr0RslYl8wWd9rKysKp+TD/YsL/crQ7OQ=;
 b=luvf7gN4Pzs3ErkkIvL5529zle4cO8DUPpCfV+9bKblMpWNCnHCbzAg7e4u6qOgvPT7+5wBNphtha2bvjsqJpJ7mRJrDCCQF4o9YDsFy1fBzDj2USlio6EQtwf0LSiD+I0ygJIVsMm5D441g8LRsO/tTQZ5XGzgy324pbfFGXQik9+zmeefqd4tllOfxQa3JTecPIIROT5bc1oRHz7AUuLYLDZhWP9RU02NYqvIwfA1JO2gOcdEIoPO6cysZjnXrWXCxKi62qFPmv8kFu8CmFmpYBRyc6Rm7ESV1cpgvybx1J5y9dQuToRTVnH9C1ICTwqVBtH2b08kMb9rel6Qceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt9N0nClg2Wr0RslYl8wWd9rKysKp+TD/YsL/crQ7OQ=;
 b=rEWDge8HIZ53Nkug/Vb0Tv7RNE6mnuYP5bFREN1v8MRKrrwZf+vxCmoh7vHidKbqp67ljl+VI244spcon0xjm7cTvekHeeyQme9yhSAm+LpxDCtaSefraMS3KwcvLcBepRmz2wb5Bns7+yeu3JheF0iP9gzxA1+Tt4OfAwtTsBayYZ8drsOeqc+ae7RWW7PQWD6giw/qtjDkDFYPUIaxkic3qgZkeg1UjZ3pcFL1F14KSGtjtRMX2GVCZN86dtIx6JuD3hvWnKsJwdgG83cMUz0tBcqP/KwMK8E0EYiD93L5nB+OpjQJpRXV19akrVe/czYHxmSLSeEgBzPZvi7Fsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:30:20 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 22:30:20 +0000
Message-ID: <4bd068cd-9189-41a9-a58a-454dc8905bda@nvidia.com>
Date: Mon, 5 Jan 2026 14:30:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra194: remove Kconfig dependency on Tegra194 SoC
To: Francesco Lavra <flavra@baylibre.com>, timestamp@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251126104618.4117083-1-flavra@baylibre.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20251126104618.4117083-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 513199a0-8a37-4d21-0e45-08de4caa0224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGd2MXdDSmdESGdLU0c3T2pObDNuMDVCNWM1SThGYko4SVJ1cUJSUTdqc21D?=
 =?utf-8?B?MjdLYXBjcmtoQitkckdpZ1FZajJsck9md3FRUTdVWVNOK09lSVFOeGJqVEpS?=
 =?utf-8?B?ZmViWkpMR1ZpQVhXcmhHbDUrVEZ3Ri8yZk1IOWNoZjg2ZTVEcHF6MVdpaExh?=
 =?utf-8?B?Nlp0YzdpTTFGWmMyamxrUUl3d1pOYjNXODJlMy9qa0x6cFNVajVWZnlTVXNY?=
 =?utf-8?B?bDFMY0NXV2JDaElQckNUTWk5eU50NGtFT240V3gvc2l3MHViUTRLZGtZb2ZX?=
 =?utf-8?B?UndBWFZYbkdYNnMrZFA1VGx4b0ROL3VIRW15eWx3QjNqNVZCS2RMNHFGNjEy?=
 =?utf-8?B?cThiTjR2NWIyQzVYbmNYaDJZSGhETGoyaVp6QWdJR1o1VzdMYlRDRTNJSFlw?=
 =?utf-8?B?VSs2L3A0a1NpMEhMM1NjZ0wzdlA4UHJ5VEJhQlIrd1htM1JHTWthVE1YWmNo?=
 =?utf-8?B?dnpNdHFrdTZNNGx6MW5yUGhTbVJ3OTgrck1uUEl3cEJwY3RmcTFUeHhHUkE4?=
 =?utf-8?B?TEhWUTVFeHMvL0w2TFBFWlp4RVNjVjQ1bHpwSmh4R2pSZHVUMzhQa1FiWmF0?=
 =?utf-8?B?TjZiSFhLK1pRRUhZWDFpZXZIQVNSdSt2Q1kvaGJsaHdwVVJEbEsrZjVra3pM?=
 =?utf-8?B?SU5rUk1PK1ZmUUFqa0JyQmhBZ3ZXRnNmY2xURWhia0VzZDlndlQ3USt2TzRJ?=
 =?utf-8?B?SmRDUzdxdW9qMzhpUzlPR2JidUVNem9waDh6UytEU0VBc3FVWXBway9Kalp4?=
 =?utf-8?B?L093Z3J2RXFXMGU1MDdaMDF0S1ptVW9KRkdBMmN3ZzdiQUFIMmt0VXN4c2g0?=
 =?utf-8?B?Sk5kQ051MjhCcmtIZ1lxc3Fta2lqeWY5TlZ6c2ZQWlhkbENYS085YUhZamxz?=
 =?utf-8?B?aklaZlNQYUlEcmJjYkJCNnFleHNWaTVQYU9YQ3BRV3h2enEyUVVJNGE5NDFz?=
 =?utf-8?B?VHJKeXlTTjAvMis1UVZucWdBdExER1FQQTRkOUZ5dVVSb3crTndsbDNQOC9M?=
 =?utf-8?B?eDNDTTdzYlZuNWVNZUVvQlJLdnhLT3hXTm0xcldObU1mNmRObmQwRXJiMlVC?=
 =?utf-8?B?NmVLMDNVTFZnZUFyK0FTSmxvMzBxdlFNSnpMdWJjaWU4ME82aExlRCtmR3p0?=
 =?utf-8?B?ak1vN0pvbWJsRnpwUFBBTW5nckQrNmZQRGlicWFiMlY2akFqR0FSMnRCUjRU?=
 =?utf-8?B?SElPS3VPUU9WMG1VdXpyYnltZldOeHh0eUFzTzNYYWVLSXo4MUdBYldTUDFz?=
 =?utf-8?B?cUlPYXpEZitwbHk5SzFMbFFPMXprSmNNMjBsK1UvbzZrY29sc2JISTYzNnhu?=
 =?utf-8?B?VmRUVzhLSzc3eEYzZjZIZE9rNUhqNmgyNWhJMWh4WEVUY0xnd3JTTVNlNnNR?=
 =?utf-8?B?cFNSdld0cTd5TEdJL2FvWjBKQUJsd2tNN0U3VEhVNzVKNDhZeW9LYjUrQ3JV?=
 =?utf-8?B?ZEtPSU9hZjQ1Yy9qVGFRVDRQVmRYZHJWd1paTitjMlhsRmx2NnhENDJ5Qmt6?=
 =?utf-8?B?ek1Gc1JMOFNDVlppQ1lmUHdhRWZBejlkTDRRTjFnS2pvRWhLZEZPNS9xcGVJ?=
 =?utf-8?B?Z2pqOCt5d045eVBFQTJuYndvUnFRVm85eFppeVVlOEtEQ3VUN0QxOGU4V21E?=
 =?utf-8?B?Mnh5S000WGlGZzA3a1FnQkVJcEZRNDhpdUdaZlZpWExZV3BEQVRTOVdvL0ly?=
 =?utf-8?B?WWhnSnhiU0x3Mk1hbHBwSU9aYzJxalNUNjZ1MFdtUHVFQUhKWktCOUhoSnRu?=
 =?utf-8?B?dWV0dVVhdmxmVlN4THRneWg3czFnYWFXNEUvYUxXdGkzVElWRFArVVlYc29m?=
 =?utf-8?B?SjIrRVBCeXV0dk8rOXRDNlh6TmNCTklJb2NYK1VGelNiVTc5ZlBDNTlnS2Ux?=
 =?utf-8?B?NzM5cDZvWXVQMWpUVzByc1YzK1hnaEVmOHc4SnV5Q0ttOUFQbFJIQlFsM29y?=
 =?utf-8?Q?CA/v7fHURm1nuNokweVx36nrhSohS7xm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGI1aU9PL3JEekNiUGhjOW1rb2pQWWJpOXZwNExidVBjMGZuajZlQzBVekhV?=
 =?utf-8?B?M2RCSWJRbjRoQVNMU25mR0xwbmNvWndMZlJ5TGdYU0dCUUlNOTdSYVdESVMr?=
 =?utf-8?B?Y0J1UThUTWt0Rmd3cG5BZHl2MThMVkswZlVRM2RxYXphSFA2V1ZCakNaTURU?=
 =?utf-8?B?Ny9kTFR4NmN3Y1pRWU9sLzBLaktrMTNyVndJQmlIRDI5bldCalYzZGF0Mmp2?=
 =?utf-8?B?Z3loZFdsQlBhOFR3ZmNoZTY3S2tyZTV6cHR0b3R2emVwU0NIRW1Ta1VVNEhs?=
 =?utf-8?B?eDRXNXRTRVZYM2M0Vi9kYlkvekxjaTZ3WU84bHJENHdoNEVJcXBITW9QSjJh?=
 =?utf-8?B?VmZPUUhkblVoUUpqOTE5WXo2c3I1MjBXT09IYndNTnh4RHgvM25XajBNYUtk?=
 =?utf-8?B?dHRZeGNmUUxRN1gwZUdhUzdMOFJOUTVCbWJNbkVYd0tNUCtZakgvbmZ5K1Jy?=
 =?utf-8?B?b3V6QUVEcDdhQ05rN0hob0wyNkRRRHFrYjQ2cVhSTUJiTi9CeWZOVTVPUjlv?=
 =?utf-8?B?NU4wa0dCQjFQZmdrd011VndEbnREanpYYWR0a2lTaEVyZHhNa3BlYStIMzdD?=
 =?utf-8?B?SmpaWFl0VnF6elUxVUFwRGlJVTdXckdSOEdEZnJaM1owTGhKNEd3bFI5cXB0?=
 =?utf-8?B?ZmtPWFJacWw0VWtLQVhnd29aTUZIV1BValVnYWpIRURidGtsRGZKSGg4Y3Zp?=
 =?utf-8?B?UzdSelRrTklYMTlwc1pVMkFZZDh4K0Z1S3IrNXJWTVFSNFNKOVdkc1V6RUp2?=
 =?utf-8?B?b0dmMkJBZGkvbzBpYjU5MWJRTENSZ3M5QVM5OUs1aXNUMFZaUmVZanFRc1Vi?=
 =?utf-8?B?TGhKbU1hSFJkbDQvNmVDdVAvUnY0blRNZEhic2hoRm83aFJTbDYwZmtpOGxr?=
 =?utf-8?B?UG5JQWRtY0dFM1l3dmkwNjNwU2VsRGJnUjBUYWw4eFRhaUcxMVFCTmt4Sjhn?=
 =?utf-8?B?M2JhMVJQQkUyd043R0ZHWVFKanZVY05nNnZRdjlhWGd5eCtoVW1IbklST1F4?=
 =?utf-8?B?YnpkV2YyMjRZbFBWdUl3SldRdnh0TFg4OWsxcG9ZbjNWQUlnbnZoamNBcG9R?=
 =?utf-8?B?QnBXQmdYV2VlbEdKR05mbEFnUHRRL1NFQTVaLy9DZDA5M3lGMUxvR08zdnVm?=
 =?utf-8?B?eVQxd2pHT3hCdURCZk5MOFZNWGxabVp6UFMwN0xoMEo5bzZIUVVtdWlwbWJB?=
 =?utf-8?B?cUREZjJwUFdGWnNKZ3g1TWlpcjBaQ1VrVStsaTQzYllYUlVyVU0rbFYyWk5y?=
 =?utf-8?B?NHBEb3RVMjk4ZCsvS0xoVlp0SFVPNTdJMnlEQlZlK3d4djVMd0NLZkcrK2Jz?=
 =?utf-8?B?N3RsWGUzR3psQTRMTjRRQ0IvNkgrTDhsS2xxbkRHU2RINWNPd0xhMzRKTXpB?=
 =?utf-8?B?U29ZL21zMFN5MVUyckx3NlJGOEU2ZzQwem52c1U1b21Xb2cyLzAzRnFKWlBk?=
 =?utf-8?B?RkszSVNMemlGRnlzd3YrU3YxVkl1WDU5bDRwZUJmMXpOTEUvT2FNanVPem5p?=
 =?utf-8?B?eGNkbFJmaHVuczN6RE9wOEdhMTFuZTNPYk1WbVpRZ09Xbk5UUS8yUkVZS0wx?=
 =?utf-8?B?Y1p0QmF0T0pDbmg4UnRFVlNmTW5BSFlzenc1THpnUmxLcFZUSUR2M1Q3Sjc2?=
 =?utf-8?B?RHp6MmVWRmFPSnI0MStyVjQ3eEJwYk1ZT1I0eEM5d3pDVzdPZE94bURVbXZO?=
 =?utf-8?B?OTdGSnBaUTVOTU1uM1BmQ2dXNy9zZkg0V3pEMDJ5TytIRzNCUVg1cllac3ZE?=
 =?utf-8?B?d1JzNE9JcUswUlh4NEUvSSsyV0oyVEw5WGF1SzZubmlpU3NDZ3ZVWkFVMEdv?=
 =?utf-8?B?bG9lVW5UU2pONm1MZDZ4UTlrdXBKdFRsUWhlZWY1Y2tiV2Y3UmtEWXQySG14?=
 =?utf-8?B?MUdYbW9VQkRrUnFYQlNNT2lVckJaZmdDejlSYUQ2TTRudUNDdzBXYnBlaEQy?=
 =?utf-8?B?VmRPVlkwRDRJREhQK05tdTkwTWQ2bi9jQ2s2bUszVmVlczM2YlpLS3pwdjVF?=
 =?utf-8?B?SVhBWFpCZSsvQlhUSlJFdDhRSGZrODRSWjUraWFSanlhVUFKZVlSRWtBeGE0?=
 =?utf-8?B?eFlqcys4U09YT3ZmMktxbURId2cvSDFNQW1GMTRIOEJYdXplZXpZRS92ME4v?=
 =?utf-8?B?MEloWmZEL1VzRG1SN1ZBYitrRHEyazlXVlRPSnhEOG95R1VKeU9sc1FaTlBN?=
 =?utf-8?B?T3lvZ3VWUEh1dWVieVNWeWVPMXAraU14cEx3RCtLTkVJVHZFQ01xbStqdWtF?=
 =?utf-8?B?MVNUcG5YZ3B0MFNubWVzWGFvQ3Z5TWZoODRLK0xzQWk3RjVPY1djdFovT3Rv?=
 =?utf-8?B?eExMUDFIZ1orSDc5dmd2OXNRRkg2NlljSktWWk04aFRXKzhvUy9Edz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513199a0-8a37-4d21-0e45-08de4caa0224
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:30:19.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbl+3xn+rZAueqX2wNLxKsCTX1BP27uGUjZfAfptEql5qG6WK/jjH55EQz3QFfsTWz6ZG/Vb03S8IQRvO3vUQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008

On 11/26/25 2:46 AM, Francesco Lavra wrote:
> This driver runs also on other Tegra SoCs (e.g. Tegra234).
> Replace Kconfig dependency on Tegra194 with more generic dependency on
> Tegra, and amend the Kconfig help text to reflect the fact that this
> driver works on SoCs other than Tegra194.
> 
> Fixes: b003fb5c9df8 ("hte: Add Tegra234 provider")
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  drivers/hte/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index 641af722b555..f57bad67deef 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -16,13 +16,13 @@ if HTE
>  
>  config HTE_TEGRA194
>  	tristate "NVIDIA Tegra194 HTE Support"
> -	depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> +	depends on (ARCH_TEGRA || COMPILE_TEST)
>  	depends on GPIOLIB
>  	help
>  	  Enable this option for integrated hardware timestamping engine also
>  	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
> -	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
> -	  lines for timestamping in realtime.
> +	  and later systems-on-chip. The driver supports 352 LIC IRQs and 39
> +	  AON GPIOs lines for timestamping in realtime.
>  
>  config HTE_TEGRA194_TEST
>          tristate "NVIDIA Tegra194 HTE Test"
I am planning to pull this in for the next release cycle i.e. 6.21
