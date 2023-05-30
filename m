Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3171EA76
	for <timestamp@lists.linux.dev>; Tue, 30 May 2023 18:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BBCC4339E;
	Tue, 30 May 2023 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685471327;
	bh=EKx6VTVPtif3VopxDUTsogjb7XDS6ckoH87zFUChkRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gNq/ZsXDpV3i7lAAIj9wedxoaIHRiPa8GeMA8KY+BCc+AtgakCixsCrcHU8v2kD2S
	 qjnXa48y6IVO/aLnDPRCGY3kpkEcBd0FFnj/Q3kjZNZ0xk88kLveBEI0YD/Kp1h0pv
	 wqPhDhAOt3KWFaOqSJcfgF8JBgPb8c5uMWp6U3Xrt7eRhVp9yhDenqNBPb0QvBwIpb
	 gyzSzCAYGhIEHZu9lj61HTMaAyZxD1CClcEgLnZnW8fT6ECmvgfC7/PZYbL1KVFZ4v
	 uJkNEAot6nXMpDrNfwQgTKt/eHJTPJdb3HZtlkh3yVLR3bETuF72j3SQtRz5ujEj/a
	 wwctPjUFDTKeA==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Dipen Patel <dipenp@nvidia.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Dilip Kota <eswara.kota@linux.intel.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
 timestamp@lists.linux.dev, linux-watchdog@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, 
 Oleksij Rempel <linux@rempel-privat.de>
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 0/7] dt-bindings: restrict node name suffixes
Message-Id: <168547131548.1034788.34188090441869561.b4-ty@kernel.org>
Date: Tue, 30 May 2023 19:28:35 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5

On Tue, 30 May 2023 16:48:44 +0200, Krzysztof Kozlowski wrote:
> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
> only decimal numbers.  In few cases narrow the pattern to also disallow
> multiple suffixes, e.g. "pwm-5-5".
> 
> No dependencies, can be applied by individual subsystems.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[5/7] spi: dt-bindings: restrict node name suffixes
      commit: c4fb6880edc15866a530c7b8f2698ae65f80cfab

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

