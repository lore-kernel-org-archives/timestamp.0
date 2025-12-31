Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB17419E819
	for <timestamp@lists.linux.dev>; Wed, 31 Dec 2025 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767140955; cv=fail; b=oabLhtqHt/PC/KvTSZRLFnwAJlvjDXrkpT04j/Y3EeKiuFIjvmJltrcyhw0aovJ3zCMFOfMS2fp9FSEhnWTK5t90Q6Dc4Vr+p0LFJksAL4zV/tqSRUJoJRQ/zDH9TaxV5sHsif0k+BXBbHdgalqyIXRNGD1AlnDciYDOcYKbNtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767140955; c=relaxed/simple;
	bh=xcU1MUKA0Db3uAp1RgG0Nth66ouKYVazMHnTS5r9LOI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O8uXWBb0T0yzfBW86JnElEh06mIn/Xjgate7q9sB7yZsyrIpPxJfYn4Qc/mSMTdxzyTghptaE/cQFsDqghdZ9rtCl56R6Dg47oQXSuU/ND7tkXILnRrv10JRb2fswR7dP3FbfvaoJ9pL6qfax/rgnI7hPKj5ZSoCQR+NVLGODRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oa7yb9cH; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oa7yb9cH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcaLfCZxjnhuYAPwE+k728RnQHTUdHCPFe+W8oVzYFECZrgtjeXXQPzJq3IKMYmUUpK4yOG0sUmmb0lJcq82bwjrVm3tq6zfBxaaMw6Yvz7g6Qi3LjrP69cer0npuZe82a1uF3VkcUvFhtWHZbhvdEc8PP9UIL/jfnMHMKyahSbjUnv6GMUF+6vL6+zCbSUuvhkdgLD8rqjrX1eXzDnSx/4cFha4cBKgly6ulzSFPVVyNYiO8BnXNTP9iEIzpzij8HrXtxWHAqJSwN9HW15Pu3l5EnnQQaFjBb38JYyl2fGVGDhAdoxQY3wwUcvbFcb534RucVll7uMk4aKEm+L89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8UIuoLQ8lz61PEbCJBy66dJQpcRWrJHKLGM7dp3dBQ=;
 b=mIVzFnxDdiYdXX592IlVXXVu1xtCZ5ry7aZ31pfnamwSnDwzun/Pt4ip+N9Kjq4QHt5jNTq1gk4ZTqQsbiLd21YXZ46iHb8l0qrJf6TziPaGGFepZNqj1+wvnyhO+7kddNvcSnfN24Ffjma5q9MAcwdaR+12n9NKWWIWe1O1tPrbjl4/ClHCEuLUw1J5o85xzxhNUxr/dYw75eoLak0j2ZAP5DCh5F9TWYoYL24GMCakfXqbxWIEn/CPspZKGrRifORnpMN7YzLPsSI1rQxsV1g1I/df/1Ic4nh3nUOCy3vtSyuRBNQRw8+/Jc07EEHlcSgdKGQ/V2SNmIZ+n5ksSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8UIuoLQ8lz61PEbCJBy66dJQpcRWrJHKLGM7dp3dBQ=;
 b=Oa7yb9cH/7+jxu3wi9KCDb9xTlBilN0tRXvU1gGgbgU5EeL35yJ5O97bGr5lPda0J9K/6roec+i9iWKAjv7XBaAmmDvLlOghyNID9tyyEwnqz2ZVU1XApDJpCS0mL49PA8g3MG9r3R6GUYeIXq4NaVC5xSHu9DYfA2bTl/TOnYhMYTb7b+wt3cubXm/23GQzPGqcvZv4CaH4MJTINhUvvpKmVxJX15nSKjcwXQFLFprH2juxQswQBRn6l06APoPCmFB+xcnwYnFAGlo5lYEwgsSdp0dOMiotavqpsnjRZM1SVQUy61403+N1/+XBLmrMhj5BClMh40X3+i3wbwvyUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 00:29:10 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%5]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 00:29:09 +0000
Message-ID: <e18a8605-5d39-4bd3-b356-a00c6209fee3@nvidia.com>
Date: Tue, 30 Dec 2025 16:29:07 -0800
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
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f7dad5-aa20-453d-4f37-08de48039d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnpQdWFDdlY3S1ZUdkRGSk5SRUFicVNrdnlaNUJwa3FXbGo0RU84bldyakNw?=
 =?utf-8?B?Zk9jUlBPeHB0RW4vRWNVOTNXR0FGNCsvNGx4TjNrYlprbFVXc3JIeVFRNGdo?=
 =?utf-8?B?NXczMEZ3T290YW9IMjMyb1k1S09MODg4cFJTUUp1amQzcWFHbEpzSWc4U05M?=
 =?utf-8?B?U25DMkVSTDJQc0hOVHowUkFRM3djN1BDZzBkdXUrYnFXY21uNjF0cGpaNmxX?=
 =?utf-8?B?c05ZdnFiR24wT2Z2QVZ0YnQ5V3RKaHNoQWQ3L25WUkNnVlV5dCsvY3dkVk9k?=
 =?utf-8?B?VDhMYzFwa3NiOU9SeHlWckpyaFVuM3VUTmxodWc4WFJKR0d1d3E1Y1U3a1M1?=
 =?utf-8?B?dnhiVVNOR0txZlpyUytjTFZzZkpGYTd6aTRBNmVuWnl1K0Z6eHNiRmd3d05p?=
 =?utf-8?B?NjB2QXhJYlR6Sy9uMWVXdTc1NGprMjFRK3g4MjJTTUZiMjNkcXZmWUgvK29B?=
 =?utf-8?B?WXB4YkZyV3o5OW8xQi84STdOczJqdFhmTTJUVnNpRTQ3NUdkdWg2U3FHVzNP?=
 =?utf-8?B?ZjVsNzU5UmFWOGQvTkdXOEJlUEdHdVZXejQwOHJxQnk3alc2Y1lmZFZLOFg0?=
 =?utf-8?B?bC8zZ080U0ZGQS9TTHd2SXNHdER1L0dEcWlrdEduejhFbVo3WTJJbHQxelVH?=
 =?utf-8?B?alFucGNTRWZMZ1Y2YWUxNWZWd1EyVHdiUFg5Q3pEUTR1UzFJQ2NXcTZmaUJC?=
 =?utf-8?B?SVdIZ2UrbjVNcTgwV2V2Vnl3NnpxampDdmdTNVJkWVJFOTVrcU9PTkNqaDdR?=
 =?utf-8?B?d1hSbm52MkhWY0xBeDFIZzFSMDd4MndoS3NodG13MjRyV0U5WUw3WTN3dVNq?=
 =?utf-8?B?TUlmcTJOM1gvZk10Z3ZuK0hTLzk4VVRrTDNOYkpBVVVEaWZEMlR6Ynh3QjB3?=
 =?utf-8?B?R2F6eFZhNGIvTjZtT05pcDZKYWkyM3pmRHBlNEFsYU5HSGRzK2F2UUdEd2xo?=
 =?utf-8?B?aFJKNGw3L0RrLzV5bC9UbjBKOVBuRFB0WGkyV0trSzNIRWtMZGpWZ3hhUzBh?=
 =?utf-8?B?ZndOYWt2dGtmd2VVZGx5L211anRnRStTazJLUitHRS92VWRXZ0FtUjB5bnIv?=
 =?utf-8?B?R0MzYXV5T1FKMmRId25YeTVwOHRxUkdsZStQT1Bpd2hiZGpuR3pmUWQ4WFdv?=
 =?utf-8?B?Ym1NaWpMY2JwYmM1dytTTDBCWjNZV0I2VGFhM1RoMUh0UldjaVk3YUJ3TC96?=
 =?utf-8?B?SStod0RjSS9mMi9oSCtEVUVMTFFPN29vKzQrTXNlMzAyY2dCRGEwaGh4N0pm?=
 =?utf-8?B?bUdXSjNLWDZGSmZZVnNCTzJURXdrSnBtbGU5TEtWT296bkpKNldxR0ZaMFls?=
 =?utf-8?B?amlsTGF6NmhRellaWXpWNmUzZ2hIZlVaV043Q2pQSmdRdTRnL2ZPejk1YmpC?=
 =?utf-8?B?S2JicmhWZlVnWDZJaVpmSXgxQlZyQzdIS1Bsc2grYUJLMDE1Y2dVRURrWjN5?=
 =?utf-8?B?cWQxWUhzZWRhSjh0TERsVlhXN3djVHRoSVR4c0ZZaWRkZnFyRjVKdXpPZXht?=
 =?utf-8?B?UkVzazY1bTBrYy9MRGRjaTJGV1Y3VXAzaGpuY09PeGtLbUF0SEJ4dHlweHJq?=
 =?utf-8?B?YUtzakJzNmp2cmxGQnBaZm5nN2dpd3oxb1JibGtoNkxkY0lJUndWZlpmT0pM?=
 =?utf-8?B?K0ZGK1VPVUpYOTFUdTdMcC9UNEZzamQ2MUwyNFh2VEpGTUFLeFZNZmQ1S3ly?=
 =?utf-8?B?MHJwSmZIakhhOUovWEVCcjRSYkdxS0VpUDJYR1ZrbklzUlZFVVJRTHo0ak8x?=
 =?utf-8?B?V3JlMmNXZXpaM0xaSWtPcFhpSWpYeHJDd3NST2svNmZZSVRFd3d4Njd1SFlo?=
 =?utf-8?B?ODNJUjdxNHhwM3VmVVlOdXRzYjR0bDNtU3ZVdmN4cnk2Vit5TEErK1lDYVd3?=
 =?utf-8?B?b0d6Rk9pazZCbzhweEZ5dldEOWVrL1R4TzhJT3dxRm00VWt3a3p1V3lHdm94?=
 =?utf-8?Q?4qgLpZF38iqnHuLuYNB5XbFHremuvuad?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVnREFJQWtGRnRvaGt6eWN2dnNlM3kxRm00Q0FKNXRIY0taZytJaUc2b3h1?=
 =?utf-8?B?QjZnRDlkbUlwcmUxZldUUnppS0JIUFNsTHFvM1VlU0p5S1I0c2ZrZkJkRHNL?=
 =?utf-8?B?ZWozOGNLckc3aVFLZ1c2d01Zd0UzRHlTcThhcW9SMkxsSk0yeUdxZ0hTV3da?=
 =?utf-8?B?S1k2T1FXVXAyS1JTVzhiZllieGlpeFpNTlVpaDV2RjZhQitCa1hMMTVxdFk3?=
 =?utf-8?B?OW90bVhTQVR1REIzb2NzTnRZb0pSeGlkdnZPRWx4Um1PLy9pelFjWUEvODYx?=
 =?utf-8?B?RHRmLzBVZ3djNkJqcHg3eHYrQUwxb21QVlBQUE5peGt5ZzB5TWxRUHBNS0Z2?=
 =?utf-8?B?WlE4WUJ2NnNtcG1GZnVsWDFmeFI4aEtrcDNqcnZGRC9rM3pkbEM0cSs5alVs?=
 =?utf-8?B?T29vVjhDMlZPbTdXa1BjdTVZdlFZQXZ3QjUxblV1czRyS1V5Q1h5N0pWRHd3?=
 =?utf-8?B?TDdPSTJKcUppcDh5Nm5ISUFITUlpRVRFZmtnU2R4aEZQUUFydXZyUTFuMlE5?=
 =?utf-8?B?Q0pLbGU3aTNxaks1bERkWEN2Uk1Td0JhMmtvd3JTaTB5aFJRQlhraU1rNmhi?=
 =?utf-8?B?cTlQdkMrckZUZjN4U0NWS1ZaVUZYYlZES3ZPQ0I3MlJGSmhXd2ptVXJxckhK?=
 =?utf-8?B?RGtqWGQzZ2piZ3lqWno2YWpPU3ZTeWxCN3JpVm1MczBvU1FRREN0RDYrYTl4?=
 =?utf-8?B?S2NNRTNzSk0vYkhhdm9LZ28zSkJaUFk5cXc1bnBkeEJudUFVMFJCVXRsSlRS?=
 =?utf-8?B?cUlPOTFzMlFSTFdna1FKNHhJZ2pMZTZKMVM1UUFJdXNlK1pJSVJuZEZWZFBj?=
 =?utf-8?B?MnZPMFhEQmlTSTFwYVNhRVp4endjNFh3U3V0bWhGYXA4S1RvS3QxZW9INGJw?=
 =?utf-8?B?UWlMRmVsUEYvNDlXUHhhd0xUZVpkK2RoOEJIRWF2Y3hBUjVTNXN0QkZJMk1S?=
 =?utf-8?B?TVA0WFdmYk9UK3FZTDl5OW9lcXFrdmtOL1FqYytpZVVMRTlyUFY2eHU5NWJn?=
 =?utf-8?B?NzhUSUVkVHZLcDB3eUpXTjBpeVlDZUgycVN5c3ZxS2h5VnJqVnovdWxDTFB0?=
 =?utf-8?B?Y3dUTUk3dE9hSVZMTW9vZzBZUTBoNmpIUi90NWlMVmQ5cHFCQ2xuM0drTjlt?=
 =?utf-8?B?akVBRnFySTJOK1FwdmQ1SXBXUmV4S2pmUnRpdGNiWEprZXN4RFZ1QkRGdWZk?=
 =?utf-8?B?aUpwZGVsdG9Ka3FHb1NhVGNVL001YytlbzhJbU9TMFdnTlFvTytLcnRUZXoy?=
 =?utf-8?B?OS9HaDFEV0psQnRKMUxEVUlFdTVUQnozanlnME9CTGpHQVFHblp6T1NXRllk?=
 =?utf-8?B?c0lHc0VXMFptQzd3OGJ2Tm4zUkQrbGUwcUIycW5hYWNUSHdJblZpS3ZaS2NN?=
 =?utf-8?B?Q0gxZHYyT0d4Q281d2kvTkpuUmN4N1NyY2hPWWpiTElYekVLK3lQamhaOWs4?=
 =?utf-8?B?bTFVQmRUajd0SzBUUGZjR1QyN1BGRVVNczJGRVY4UnNCZ1JsSmxwcnVaVWxj?=
 =?utf-8?B?QUlqcERpNEZLUnEwZHd5VE14bUNOdnNubXB5WXRxR2lGRnFWT0lQME93bk1Y?=
 =?utf-8?B?a0hVdXY4SXBtVjQrcitDSTExMStEU2crVklhNytSVzUvTXBTdU1RSGowT0Zh?=
 =?utf-8?B?Y09WSldkQTJiSjlXSGdoZlVLK0pVcGswZXgxL0twWGFJQXVveEIzWEE2dU5G?=
 =?utf-8?B?NHhDb2luVWZvdzFTOTlLVURSNE5YY0JpcTFXVDEwOXE3MjZ2L3lVWXdMSDR3?=
 =?utf-8?B?djIrbDJqYTRISkxOc1JEYnVDMkRKOHcxdFhFYzlpNll4Unk2TzRUdUh4dG9h?=
 =?utf-8?B?UXFTa0N0dG80RktNMFBld2paZFh5d2pyeEZWdnJEQkROT3d6YXJkU1ZJb0w5?=
 =?utf-8?B?ckpHT2t2UU1HRzFobDdSSTJ2NlZuSldMS0VlSmI4R2U1VGdocTcyQVYwVkcr?=
 =?utf-8?B?ak9UcjBzbk5jY01pTUViSlZZY3hlamVTRm9IMTB6ZUNvc0ZKdXdjUU5Wa3Er?=
 =?utf-8?B?OUQ4TWJxRE94ZVgvM0JwOE01WjE4RmhiUWJqWkRsbWNUbUhSdTlDMzEveDlO?=
 =?utf-8?B?VUZkZDhuaXRJS1lxaSswUytUbUxkMVhjZ2V2bmZGNjB5ZUUxdzJITnp0d0hT?=
 =?utf-8?B?eGxDeG54NStFbnVPNWxzU0NZRTRmYkdIZWxJSWJuMUNMWWpjZ0RMZ3dSNzd2?=
 =?utf-8?B?b3RzdStuSko4bnNubkxCM1l5cko5a3RRRDBTWVJPVk00SFNkMWFoU0kyQ295?=
 =?utf-8?B?TnJVYVlDelNGSWtxaFNGalFsYi9VN1luZlljaEMrUzZPRWwrR2YwVlJmWjMx?=
 =?utf-8?B?VzRiS2NxYVdEZ2hweXM0MlZCT21UODdLNWJ1bkpqaGtaWngvQ3RaUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f7dad5-aa20-453d-4f37-08de48039d71
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 00:29:09.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzS6zQZ7qQQS9eFe1HRDrY1iAFiqRISfZWxu96sMSQ/rzOaXmRPoPojmmHO3TuxN7J+/8vTcG0SOVs9vNdv/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

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
Acked-by: Dipen Patel <dipenp@nvidia.com>
