Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF927FD6E
	for <timestamp@lists.linux.dev>; Wed,  7 Jan 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776127; cv=none; b=hCHuoLu0UUvMQL/2CPCB/atPYF8WDNxxBrPRuGTooqTD62nSqG3VLmqtqvnMaIEgVhTiopzH6NmUs757s5NIiVwXK9NB8g9mg/qH1fXeBJNq/9rLwME0qPij75s2Spw1h8vytv5hs2eMC8Igc5U3TE4HVac+hEqefQ7AApxJ8iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776127; c=relaxed/simple;
	bh=g7S/sOLJOF0Q+nN5pmg9kKWwdO1Xtp4Hvvj6/7cSbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFf+HSZT5HOvh/ygkoeZHJVGgE+5MyiDrwbcZenUVcLVf2ygTcKcLhbMdPrAmGgjcktIugXArkpSTCnG/AuO3Rc1dekmet26VpcQlSBtfeQC0lORx3JOTB6MLI2CpSKrRq37aHXwuyb6EGMi305Ah4wCQk1chSuHh4txOMTMdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bIiI/FfP; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bIiI/FfP"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382f9211cbfso11749881fa.0
        for <timestamp@lists.linux.dev>; Wed, 07 Jan 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767776123; x=1768380923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7S/sOLJOF0Q+nN5pmg9kKWwdO1Xtp4Hvvj6/7cSbw0=;
        b=bIiI/FfPrzPDw4PEiDZOdc0aiUq47dVJVo/XfKgAVhDI1Z7SefjgGGZBIwvfHs1WO9
         bv/l6mbGH8/b+GFMO5OxsfE/XNRnhlpQodnRxwoqTkZpU127vAjjTgLQamYBSn5AJHuy
         OdBisoO4nicU4dG6FEklr1ic1n4OnwcB7iTVEcTlHHyq19AebAY2dZHhHJaZsLY+dQtD
         jNvCfLPq7bu9T8jazjiw6caC+9FK4Ako1GLDZjGBdvZXpB/vDvjcPidFeDghkTum1Lcg
         mOlsrjbcFmoUCphvPkrGUycwnvA/OuojLlEo4YyqtPyOU9Ey9fZB5R251WFppFIzfz+N
         fpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776123; x=1768380923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7S/sOLJOF0Q+nN5pmg9kKWwdO1Xtp4Hvvj6/7cSbw0=;
        b=CCZFM7YWjejMlxn2kBsJmD+QgyxH5VtyWYOKTjE7Y6meieBCANOtgJyRziIgMAcNdi
         D2LXaGKa5KblecwHvxbW/1IR7A5T4Oh3BdMPbEuEHw3i77okEG3PFHYi6gf/PbdHZBjO
         //6I/yRu5ezcpsqRmWvGHdsHQbmOTLI59e8BjN8rjrnwksAx13pVUn0qnnVPDNFdrFjM
         B1u8g2bDPZoZrYq1huny6Up/WZcXxPDZYd/xVEuyl7/T8JRmqtGsrlzZEQfpWbb1vX4Q
         usBWMYvsgqMrSNi5liPOtWcFvFoXV7MulY2E08JEOsCstCvQnJi4Kt3yHq1Puaob02Jp
         rHsg==
X-Forwarded-Encrypted: i=1; AJvYcCXzC7drLrOTzs4wzHwEyvlkVX6aCgnDO4wPUbMCzCEDH8+dKEncwR8NhKZgnXZFngNuN1mxTugmCdY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQRbom+nr4diQlKVmt8esXWMnDRLjjMdR7PzIqvjvyfhagY3A3
	R6qt5c38AU6u9iflxPrJZ3LCownukaY6NJdU3apcqPXmRhKw8pm8yReavj3UpUAkSIyvqlh2DTe
	QxMRH6fS2+Gw6tvxbLZu0ZBUirzHJ6Td89uf6Txy3Rg==
X-Gm-Gg: AY/fxX6lXW1Jm4TSpi0SRzfMpoMk7E8kU6O/7utobmT4YI86Klv2ztLN3j1Q11UJZEd
	4JleLVVCAP0Wx7mUnYXnWckpM7se4BanTj42fhMzniv7C7XAW0seAYnYhnY65wWbaydHKbXM3na
	/ZDaSzuvc/O8q4RIOB2KZuWlxPofVECoObEJaTG8aK6f91TjdEb7KDO/ZJiEYB7uIPYTpoqA6nn
	zz53xWdxjA6xkECjXf69Z2WMvONPzMM2EK2q7eBU49OKLOWH7v57E53ZQB3gU3q74jSS7fDaScc
	JOL/xpQDvgrucSx2C9l3lfvbXURr
X-Google-Smtp-Source: AGHT+IF/KqXP9S3gHjejM7kaY7xaxvH87TrqflNt0c61EWOsW6jOkr28MzZCHrY2EtX12UF+/U5S6v67dKM6x+lHHTI=
X-Received: by 2002:a2e:be13:0:b0:37b:ab43:8958 with SMTP id
 38308e7fff4ca-382ff6aabc9mr5144911fa.16.1767776123380; Wed, 07 Jan 2026
 00:55:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251224143234.47424-1-marco.crivellari@suse.com> <6defe6e1-873e-44cb-91ba-b30debc33afa@nvidia.com>
In-Reply-To: <6defe6e1-873e-44cb-91ba-b30debc33afa@nvidia.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 7 Jan 2026 09:55:12 +0100
X-Gm-Features: AQt7F2oq2dXuxXdeXZBiO-WmtDcjdbvAB_G9PMtxlME-v1H5Q4-Ea0Z2NdtclEU
Message-ID: <CAAofZF4ZkXhsRO6DNMKnU_=q6B3t1M=tZvNKofc1_Z7czk_kmw@mail.gmail.com>
Subject: Re: [PATCH v2] hte: replace use of system_unbound_wq with system_dfl_wq
To: Dipen Patel <dipenp@nvidia.com>
Cc: linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:34=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:
> Hi Marco,
>
> Do you want me to pull it in my tree? FYI..I can do it for the next relea=
se
> cycle i.e. 6.21 timeframe if you want this to be sent through timestamp.

Hi Dipen,

Yes, it sounds good to me.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
