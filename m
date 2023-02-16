Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBD16120
	for <timestamp@lists.linux.dev>; Thu, 16 Feb 2023 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D37C433EF;
	Thu, 16 Feb 2023 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676557095;
	bh=FJ/3UUWVjEdyo6sc6ZR1O3Q4KgQjH18wZv40K7Gof6M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ix5GRxoJn+k+9ve36EFVTZOAAPQNXVIXjT+0mFF9O7L62zuzPEJ9cDrEWxAxi8bTr
	 czE37Jf6LNa/aCYs9LaJpSbJLuPyn63SKCWY76kuwysC50mh8ZkMNXAd7ci/EOfQ+Q
	 M6PD88cnympwxc/0DTqkkuk2drSH1ELQJqzA0o+GCRv+xnIvMM+e9pwZwJwDtBNEYo
	 SABcScV1X3lYLo4OBer/IlNAiTmVjfxYGtqh9jRl5L3m0sOjSqnqlaWgbe60JOeBm0
	 qxA4aI8lhOtuiYuUrk37SMCQgCo9nK5Y7lyEx8FfvAi3GPR4KbiP7s0DX0HBmN1VBm
	 KnQOa2GT7gsgQ==
Message-ID: <16e3ddb4-219e-70a8-8644-c62973f84d31@kernel.org>
Date: Thu, 16 Feb 2023 15:18:10 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 6/6] arm64: tegra: Add GTE nodes
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev
References: <20230214115553.10416-1-dipenp@nvidia.com>
 <20230214115553.10416-7-dipenp@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230214115553.10416-7-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:55, Dipen Patel wrote:
> Add GTE nodes for the tegra234. Also modify AON GTE nodes for the
> tegra194 to remove nvidia,slice property and add nvidia,gpio-controller
> propertyto specify AON GPIO controller node so that GTE driver can
> do namespace conversion between GPIO lines provided by the gpiolib
> framework and hardware timestamping engine subsystem.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi |  3 +--
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 4afcbd60e144..4c92850b1ec4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1363,7 +1363,6 @@
>  			reg = <0x3aa0000 0x10000>;
>  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>  			nvidia,int-threshold = <1>;
> -			nvidia,slices = <11>;
>  			#timestamp-cells = <1>;
>  			status = "okay";
>  		};
> @@ -1586,7 +1585,7 @@
>  			reg = <0xc1e0000 0x10000>;
>  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>  			nvidia,int-threshold = <1>;
> -			nvidia,slices = <3>;
> +			nvidia,gpio-controller = <&gpio_aon>;
>  			#timestamp-cells = <1>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index eaf05ee9acd1..4a87490c5fd4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -1086,6 +1086,15 @@
>  			clock-names = "fuse";
>  		};
>  
> +		hte_lic: hardware-timestamp@3aa0000 {
> +			compatible = "nvidia,tegra234-gte-lic";
> +			reg = <0x3aa0000 0x10000>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			nvidia,int-threshold = <1>;
> +			#timestamp-cells = <1>;
> +			status = "okay";

Why do you need status? It's okay by default.

> +		};
> +
>  		hsp_top0: hsp@3c00000 {
>  			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
>  			reg = <0x03c00000 0xa0000>;
> @@ -1603,6 +1612,16 @@
>  			#mbox-cells = <2>;
>  		};
>  
> +		hte_aon: hardware-timestamp@c1e0000 {
> +			compatible = "nvidia,tegra234-gte-aon";
> +			reg = <0xc1e0000 0x10000>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			nvidia,int-threshold = <1>;
> +			nvidia,gpio-controller = <&gpio_aon>;
> +			#timestamp-cells = <1>;
> +			status = "okay";


Also here

Best regards,
Krzysztof

