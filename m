Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B591A4E
	for <timestamp@lists.linux.dev>; Fri,  7 Oct 2022 09:20:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z97so6174646ede.8
        for <timestamp@lists.linux.dev>; Fri, 07 Oct 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7yxUPtVQeTjSPsT9r8A0KoAzN3DsrH++EyW+PkGzCY=;
        b=I2b5Jd8pytJnAKBDMIkyjDU17IieIIVgWjPyvVuDzA6O/ZweUr6VC6HAIZdJAb8G1L
         Ek11tut25wty6mkjmCdrH4pjDeRRwsJCWBbZ8D13xVsmn427tiZkPEN9gMg2+uj3gc34
         a1vNjXOTirNNPYPz5C2ONg+LFWI7C0cx1fDRAgiPZpPoZp3xselDcoy3NEHd/keqyN1O
         xnzdqMCW8KoWqfW6YVpAGmNrcgHnMknlO93rmAedANEWGBw7IVO24xgcsQKoGDoOV9XI
         PkwtcFKJnV/4C+fib1hd6gbZkMUKeuaIlqtAqs5mv78w4GqCO/WRALqwBmcm2/wQAu4C
         uoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7yxUPtVQeTjSPsT9r8A0KoAzN3DsrH++EyW+PkGzCY=;
        b=ElUynMNARNQl3DiKEmPVlzEvsQ0X/cg7tTUcfdBRuwRb952mqG077qT96C8MQZb7+a
         q/MyTeLJIhXTcyGMZdqjAPGJxobTTFAy+r18g6lz9z/YpDx177FbMf0x1+SnfFoF3Nrt
         7GviG/msq1dvbrFFgr+Yu4jNhdVpt55kGp29gB49b5kZpC8ymousX95+YokzFisoLC0J
         lAg4eFWIN8KQW6O6/IrI0a/ntSeZ77IW874qFQ7pM8GqySKn94zGB4ZNuGqwSHgcf8rQ
         +Ftkjl96RkSSJLOMazTJRhxZl+ssv4F4HYgFFRhqIWfU0XSjmQnmvXKWeWEGNnRGXxh3
         7hPw==
X-Gm-Message-State: ACrzQf32HWV/8WbwYeQQ/NMPMSUIUXGaQrovzzpF8zYyJR4pnYoWTkbO
	0vJ8mdCCTk5bZp/OQUL1m0A=
X-Google-Smtp-Source: AMsMyM4LUo91cb+L+6SnST6fR7hVkZVXKQOvAqmc+2Bsq1gRHp6C/GzKgpTjn/7ibaAmmhwi8iKnjQ==
X-Received: by 2002:a05:6402:1d4e:b0:459:c178:6349 with SMTP id dz14-20020a0564021d4e00b00459c1786349mr3606367edb.339.1665134408360;
        Fri, 07 Oct 2022 02:20:08 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906319600b0076f99055520sm904420ejy.137.2022.10.07.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 02:20:06 -0700 (PDT)
Date: Fri, 7 Oct 2022 11:20:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev
Subject: Re: [PATCH 1/1] MAINTAINERS: Add HTE/timestamp subsystem details
Message-ID: <Yz/vRdLnbCQk/SGv@orome>
References: <20220825214956.19120-1-dipenp@nvidia.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V8e2+EmizuOg1hAE"
Content-Disposition: inline
In-Reply-To: <20220825214956.19120-1-dipenp@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)


--V8e2+EmizuOg1hAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 02:49:56PM -0700, Dipen Patel wrote:
> Add tree, mailing list and patchwork details.
>=20
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--V8e2+EmizuOg1hAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM/70UACgkQ3SOs138+
s6FpVQ//UC4R70o1jpskt40SMGH+xISy1mCyDGYPB6EWCamoYLmNH4XN62x/00jr
O9GnRQsGSy1H8nHmw60x5Emg3j2MUhDlRo6cwVcu1SzSuqhfhKL001g8pUsVbkJE
TQ8IS1RHGeym48lMzUVRR0NyaaWtpY19OxTOSX1Q3r0w6eX207WiCFk3oBvdO4ju
ojkKyHRTtgGcxPItFNf8D75+O2rgdbSIwP5eLa3d++WjcaEYl0q19GERqO0G0pow
pai1EBvEAQIbe4cD0uKucsLPaKB94mMxBKG+pHElz2KjXGXYT/XWPmiDf/02c5mK
1w/NraSr8/fbuICm2s3hphwbe6mouG5ThtKcvHwTNzsZUVIdvPmv+9hV5PkBmynC
QO9g7DxaMnoAg9RpkJvemUEIGRBjYbrRISsqrZFkSsRTvsF/Oz4k+D+xhiHsmAa/
olo/pSzfKhXYP8iRaEp/xDszCHhEhIdCWxB5fjr31/6RqzrKDP8d9+IGIRsZjuzp
uvAqUZeIS6xnUoQjMzA+OLrU9LMOk6f4Ny/r+UmGHyhhTmmIZUMfonEQowllwZbE
EkDei36L5fMiethJLc2QI09nVeo6LMDEYu2r3416TM2aiQatO3MEZxgGIHfdCvoE
A+WkQcnpvM0shmCEjiSScprajhrPF2gB2t77t15rOw6979zRTOw=
=nzQt
-----END PGP SIGNATURE-----

--V8e2+EmizuOg1hAE--
