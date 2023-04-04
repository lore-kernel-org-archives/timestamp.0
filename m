Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA27C
	for <timestamp@lists.linux.dev>; Tue,  4 Apr 2023 10:30:42 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r11so128605144edd.5
        for <timestamp@lists.linux.dev>; Tue, 04 Apr 2023 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680604240;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPQJYuYVqddrLpsUiSF4JuC6g9/L1+GNYqEeCmgaIpw=;
        b=Qf9ZiLsHWa67q5d6OwOb196jz2WhK7YOr7O9+et+VWP9XJTg4eS7ZGmo/pp76jWFPt
         4Kbtvtu5S3zMCsF9eVSA/S/YNXm5ggVhITb/Ngz7+umuz+DRrtYBdfzKTl3UrdN7NzWW
         O6IY8bxFhED+SxeYizHcRY3SwLERm5ZUtQuHN1aGTwiysQ10WcIUcldVRbRtkYiswHlM
         nTETOQuueRAEtt0TgKyZgsrozphoT+IYOtKCMD3aGLrr4m8j5PNzK6Je3J+NQ2mth/Tq
         N2V070Ic0y6tNpVzzPzhp6zx5ZpOQ5fxDFW2cAWXz/Wy2BIlRhwiAXRk4jwemb2Ozkk8
         aGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680604240;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPQJYuYVqddrLpsUiSF4JuC6g9/L1+GNYqEeCmgaIpw=;
        b=kV/vHk3hTQunF2MM0Zwp+HlTV1btU/7SchAlUQpX+Twqr+oQHgN+laig+ICB0/ylQY
         5xmvU4p7n/NuBWHMxYziHTIeNrmNNNKnnWA/cObpck9e65+rjpzwKui9ni2LpWrUOgrj
         TpZFUNWOsjM/5P8yXmo9z55zkzlEJ3WN3hhKUwA53W+V3EMzjUp8pteZvqzGCPODKMQG
         cxe5ZqtWIUN9dwNp+r55TguJCmPq5FWM4v+5vC7WHujTxMxzDLqxbN/bEwfforK0hS2F
         TzbC6B1HwjxnPKdvvUnvFm45wDvTs+1z7Fy4dfU44n7RimqjcUIMKcf4kFNaQv+DrAE6
         AbTw==
X-Gm-Message-State: AAQBX9e5lwLbfV545LMVhdf/3AkHX8A0RUgX2JR7DR8YnGKoYxGoTvJv
	+4bIytAnvC3EsvtQPQKWr2cPidlYq0U=
X-Google-Smtp-Source: AKy350br99HCbCDIQiZj8fwuuU0BjyJC/AwN7IrayX6NNSgMYELNtziysmKohGWt/IYRz9rEEj8/bQ==
X-Received: by 2002:a17:907:8b87:b0:8e1:12b6:a8fc with SMTP id tb7-20020a1709078b8700b008e112b6a8fcmr1480812ejc.4.1680604240440;
        Tue, 04 Apr 2023 03:30:40 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp24-20020a170907207800b0093f822321fesm5737690ejb.137.2023.04.04.03.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:30:40 -0700 (PDT)
Date: Tue, 4 Apr 2023 12:30:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add
 nvidia,gpio-controller
Message-ID: <ZCv8TviVD8n4MrnW@orome>
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-5-dipenp@nvidia.com>
 <f523c155-7d05-2034-27ea-e2e56881c0bb@linaro.org>
 <a7539193-8374-cda6-f535-360a4a8eab22@nvidia.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kKVfNtJEQjXZPd0A"
Content-Disposition: inline
In-Reply-To: <a7539193-8374-cda6-f535-360a4a8eab22@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)


--kKVfNtJEQjXZPd0A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 09:58:19AM -0700, Dipen Patel wrote:
> On 3/25/23 4:07 AM, Krzysztof Kozlowski wrote:
> > On 23/03/2023 02:29, Dipen Patel wrote:
> >> Introducing nvidia,gpio-controller property from Tegra234 SoCs onwards.
> >> This is done to help below case.
> >>
> >> Without this property code would look like:
> >> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
> >> 	hte_dev->c =3D gpiochip_find("tegra194-gpio-aon",
> >> 				   tegra_get_gpiochip_from_name);
> >> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-ao=
n"))
> >> 	hte_dev->c =3D gpiochip_find("tegra234-gpio-aon",
> >> 				   tegra_get_gpiochip_from_name);
> >> else
> >> 	return -ENODEV;
> >>
> >> This means for every future addition of the compatible string, if else
> >> condition statements have to be expanded.
> >>
> >> With the property:
> >> gpio_ctrl =3D of_parse_phandle(dev->of_node, "nvidia,gpio-controller",=
 0);
> >> ....
> >> hte_dev->c =3D gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_nod=
e);
> >>
> >> This simplifies the code significantly. The introdunction of this
> >> property/binding does not break existing Tegra194 provider driver.
> >>
> >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> >> ---
> >>  .../timestamp/nvidia,tegra194-hte.yaml        | 31 +++++++++++++++++--
> >>  1 file changed, 29 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra1=
94-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-h=
te.yaml
> >> index eafc33e9ae2e..841273a3d8ae 100644
> >> --- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.=
yaml
> >> +++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.=
yaml
> >> @@ -51,6 +51,12 @@ properties:
> >>        LIC instance has 11 slices and Tegra234 LIC has 17 slices.
> >>      enum: [3, 11, 17]
> >> =20
> >> +  nvidia,gpio-controller:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      The phandle to AON gpio controller instance. This is required t=
o handle
> >> +      namespace conversion between GPIO and GTE.
> >> +
> >>    '#timestamp-cells':
> >>      description:
> >>        This represents number of line id arguments as specified by the
> >> @@ -65,22 +71,43 @@ required:
> >>    - interrupts
> >>    - "#timestamp-cells"
> >> =20
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - nvidia,tegra234-gte-aon
> >> +    then:
> >> +      required:
> >> +        - nvidia,gpio-controller
> >> +
> >>  additionalProperties: false
> >> =20
> >>  examples:
> >>    - |
> >>      tegra_hte_aon: timestamp@c1e0000 {
> >>                compatible =3D "nvidia,tegra194-gte-aon";
> >> -              reg =3D <0xc1e0000 0x10000>;
> >> +              reg =3D <0x0 0xc1e0000 0x0 0x10000>;
> >=20
> > This is not really explained in commit msg... are you sure you tested i=
t?
> I have to revert this part back in next patch as when I upgraded dtsschem=
a it gave me errors.

We need the 0x0 in the DTS files because we have #address-cells =3D <2>
and #size-tells =3D <2>. For the examples, those default to just 1 cell,
so this can't be an exact copy of what we have in the DTS files.

Please make sure to always validate the bindings and examples.

Thierry

--kKVfNtJEQjXZPd0A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQr/E4ACgkQ3SOs138+
s6F7gQ/8CahJlsl2ie2xWVwhWMmBeCbLyErqS+oUnJBDhaLFTHrhUBNeDB0htb3x
ZAUc3dZf+3ohXsFztk9DfVoH/3PTAxFftgN05tZHBCLXaBBoE/0uVQBVw2Q6VS7C
q6XkykkbDFUBOzL6sJLZE3ucFdPTjG5HFmMF+UJF8NfmBLUWJrZ60kK8h3MQrjYR
suT5Gr0EyOHy9nbtjDS3U05WW6Oyp4ppBTFWYuYbRIHgiZybCabVROR8NuCqqO5/
17kaQheYOsyCfHwmQhNx/yH6qn/byXK0eKI8N05S9f7iBqyvgDO69LF5SVR7wZtD
6i8DaiGS80EZtslyzEIcggM2WBklv0TO6tyRJWdsBjCoN+sFnRbTMOu/XFYvpqh5
Fjk+Qedb/KaGYdzD+HjREyKCz8rjRJxBj+NyjiUCo/hIlXm3kBH+XihmLsY/3ZNs
AjXxR25TIAq+yw42/gDfdx6/PzXwZtNmYq1ogpftsffj0rUTsv1v0Z5ScCWnKU15
sIqSTXUmGBRmHErHyxV/AcgwAqljPuBVKdidyM+8IceZGD6bd56iv/Ywc28cfhNO
cruSLxYVhvMJbMk2xX9ma8PWGAaOIkT+CTfQWC7YLMVMA8oMjPa74JQHKUlsrDb+
GlAEoulplmcv1mbesr5bkm4rMpB6tjsoTElagX7RVgOOS2CALEI=
=TMqU
-----END PGP SIGNATURE-----

--kKVfNtJEQjXZPd0A--
